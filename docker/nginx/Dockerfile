# Dockerfile
FROM enospc/pacman

RUN pacman -Sy --noconfirm util-linux shadow nginx
RUN pacman -Scc --noconfirm

ADD nginx.conf /etc/nginx/nginx.conf

EXPOSE 80 443

CMD ["/usr/bin/nginx", "-g", "error_log stderr info; daemon off;"]