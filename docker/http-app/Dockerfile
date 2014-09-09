# Dockerfile
FROM enospc/busybox
VOLUME /srv/http/app

RUN touch /etc/passwd
RUN touch /etc/group

RUN addgroup -S -g 33 http
RUN adduser -h /srv/http -u 33 -H -S -G http http

CMD chgrp -R http /srv/http; sh