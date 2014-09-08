# Dockerfile
FROM scratch
# docker ADD url can not chmod +x the file, do this manually
# ADD http://www.busybox.net/downloads/binaries/latest/busybox-x86_64 /bin/busybox
ADD busybox-x86_64 /usr/bin/busybox

RUN ["/bin/busybox", "mkdir", "-p", "/usr/bin", "/lib", "/etc"]
RUN ["/bin/busybox", "ln", "-s", "bin", "usr/sbin"]
RUN ["/bin/busybox", "ln", "-s", "usr/bin", "bin"]
RUN ["/bin/busybox", "ln", "-s", "usr/sbin", "sbin"]
RUN ["/bin/busybox", "--install", "-s"]

CMD ["/bin/busybox", "sh"]