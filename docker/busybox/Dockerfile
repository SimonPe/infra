# Dockerfile
FROM scratch
# docker ADD url can not chmod +x the file, do this manually
# ADD http://www.busybox.net/downloads/binaries/latest/busybox-x86_64 /bin/busybox
ADD busybox-x86_64 /usr/bin/busybox

RUN ["/usr/bin/busybox", "mkdir", "-p", "/usr/bin", "/lib", "/etc"]
RUN ["/usr/bin/busybox", "ln", "-s", "bin", "usr/sbin"]
RUN ["/usr/bin/busybox", "ln", "-s", "usr/bin", "bin"]
RUN ["/usr/bin/busybox", "ln", "-s", "usr/sbin", "sbin"]
RUN ["/usr/bin/busybox", "--install", "-s"]

CMD ["/usr/bin/busybox", "sh"]