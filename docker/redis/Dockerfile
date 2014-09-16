# Dockerfile
FROM enospc/pacman

RUN pacman --noconfirm --needed -Sy util-linux shadow redis
RUN pacman --noconfirm -Scc
RUN sed -i "s/bind\s*127.0.0.1/bind 0.0.0.0/g" /etc/redis.conf

EXPOSE 6379

CMD /usr/bin/redis-server /etc/redis.conf

