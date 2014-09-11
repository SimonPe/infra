# Dockerfile

#FROM enospc/busybox
# sigh, busybox doesn't support chattr +C we use a debian base instead.
FROM debian:jessie

RUN apt-get update && apt-get install e2fsprogs adduser -yq --no-install-recommends
VOLUME /var/lib/mysql

RUN touch /etc/passwd
RUN touch /etc/group

RUN addgroup --system --gid 89 mysql
RUN adduser --system --home /var/lib/mysql --uid 89 --no-create-home --ingroup mysql mysql

RUN mkdir -p /var/lib/mysql/data
RUN chown -R mysql:mysql /var/lib/mysql

CMD mkdir -p /var/lib/mysql/data; chown -R mysql:mysql /var/lib/mysql; chattr -R +C /var/lib/mysql