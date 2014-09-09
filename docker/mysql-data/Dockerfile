# Dockerfile
FROM enospc/busybox
VOLUME /var/lib/mysql

RUN touch /etc/passwd
RUN touch /etc/group

RUN addgroup -S -g 89 mysql
RUN adduser -h /var/lib/mysql -u 89 -H -S -G mysql mysql

RUN chown -R mysql:mysql /var/lib/mysql

CMD chattr -R +C /var/lib/mysql