FROM debian:10

RUN apt-get update -y && \
    apt-get install -y curl tar gzip grep make gcc cpp

COPY files/* /opt/

RUN tar xzfp /opt/softether.tar.gz -C /opt && \
    rm -f /opt/softether.tar.gz
RUN cd /opt/vpnserver && \
    ls -hal && \
    uname -a && cat /etc/os-release && \
    make

RUN chmod 755 /opt/start.sh

#ENTRYPOINT /bin/bash
ENTRYPOINT /opt/start.sh
