# Dockerfile
FROM enospc/pacman

RUN mkdir -p /var/lib/mysql

RUN pacman -Sy --noconfirm util-linux shadow mariadb

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 3306
CMD ["/usr/local/bin/run"]