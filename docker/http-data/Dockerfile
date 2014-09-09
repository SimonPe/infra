# Dockerfile
FROM enospc/busybox
VOLUME /srv/http/data

RUN touch /etc/passwd
RUN touch /etc/group

RUN addgroup -S -g 33 http
RUN adduser -h /srv/http -u 33 -H -S -G http http

RUN chown -R http:http /srv/http 