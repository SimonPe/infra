#!/bin/bash

namespace="enospc"

prefix="test"

run() {
	img=$1
	shift
	cmdline="docker run -d --name=${prefix}-${img}"

	for arg in "$@"
	do
		key=${arg%%=*}
		vals=${arg#*=}
		vals="${vals//,/ }"

		case "$key" in
			volumes)
				for i in $vals
				do
					cmdline="$cmdline --volumes-from=${prefix}-${i}"
				done
				;;
			link)
				for i in $vals
				do
					cmdline="$cmdline --link=${prefix}-${i}"
				done
				;;
			bind)
				for i in $vals
				do
					cmdline="$cmdline -v=${i}"
				done
				;;
			env)
				for i in $vals
				do
					cmdline="$cmdline -e=${i}"
				done
				;;
			privileged)
				cmdline="$cmdline --privileged"
				;;
			*)
				echo "unknown option --$key-- -$vals-"
		esac
	done
	cmdline="$cmdline $namespace/$img"
	echo $cmdline
	$cmdline
	echo
}

# data containers, mysql needs privs to disable cow
run mysql-data privileged
run http-data

# the app code itself
run http-app bind=$(pwd)/app:/srv/http/app

# databases
run mysql volumes=mysql-data env=MYSQL_DATABASE=test,MYSQL_USER=magento,MYSQL_PASSWORD=magento
run redis

# php
run php-fpm volumes=http-app,http-data link=mysql:mysql,redis:redis

# hhvm
#run hhvm volumes=http-app,http-data link=mysql:mysql

run nginx volumes=http-app,http-data link=php-fpm:php-fpm
#run nginx volumes=http-app,http-data link=hhvm:php-fpm
