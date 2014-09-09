
NAMESPACE = enospc
IMAGES = busybox.dock mysql-data.dock mysql.dock nginx.dock php-fpm.dock http-data.dock http-app.dock redis.dock

all: $(IMAGES)

.SUFFIXES: .dock

%.dock: 
	docker build -t $(NAMESPACE)/$* $*
	#docker save $(NAMESPACE)/$* | bzip2 > $@
