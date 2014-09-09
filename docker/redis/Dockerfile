# Dockerfile
FROM enospc/pacman

RUN pacman --noconfirm --needed -Sy util-linux shadow redis
RUN pacman --noconfirm -Scc

EXPOSE 6379

CMD /usr/bin/redis-server /etc/redis.conf