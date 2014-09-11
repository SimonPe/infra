FROM debian:jessie

RUN apt-get update && apt-get install curl -yq --no-install-recommends
RUN curl http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
RUN echo deb http://dl.hhvm.com/debian jessie main > /etc/apt/sources.list.d/hhvm.list
RUN apt-get update && apt-get install libzip2 hhvm -yq --no-install-recommends

#warning: hack ahaed!!
RUN ln -s libbfd-2.24.51-system.20140903.so /usr/lib/libbfd-2.24.51-system.20140617.so

EXPOSE 9000

CMD /usr/bin/hhvm --mode server -vServer.Type=fastcgi -vServer.Port=9000