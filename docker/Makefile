
NAMESPACE = enospc
IMAGES = busybox mysql-data mysql nginx http-data http-app redis hhvm

all: $(IMAGES)

.SUFFIXES: .dock

busybox/busybox-x86_64:
	curl http://www.busybox.net/downloads/binaries/latest/busybox-x86_64 > busybox/busybox-x86_64
	chmod +x busybox/busybox-x86_64

busybox: busybox/busybox-x86_64 busybox.dock

mysql-data: busybox mysql-data.dock

http-data: busybox http-data.dock

nginx: nginx.dock

#php-fpm: php-fpm.dock

redis: redis.dock

hhvm: hhvm.dock

%.dock: 
	docker build -t $(NAMESPACE)/$* $*
	#docker save $(NAMESPACE)/$* | bzip2 > $@
