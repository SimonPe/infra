# Dockerfile
FROM enospc/pacman

RUN pacman --noconfirm --needed -Sy sed php-fpm
COPY pkgs /tmp/pkgs
RUN pacman --noconfirm -U /tmp/pkgs/php-redis*.pkg.tar.xz
RUN pacman --noconfirm -Scc

RUN sed 's/listen\s*=.*$/listen = 0.0.0.0:9000/' -i /etc/php/php-fpm.conf
RUN sed 's/\;extension=\(mysql\|mysqli\|gd\|iconv\|mcrypt\)\.so/extension=\1\.so/' -i /etc/php/php.ini
RUN echo "extension=redis.so" > /etc/php/conf.d/redis.ini

COPY opcache.ini /etc/php/conf.d/opcache.ini

EXPOSE 9000

CMD ["/usr/bin/php-fpm", "--nodaemonize"]