FROM debian:10

RUN apt-get update && \
    apt-get install -y curl tar gzip grep make gcc cpp

COPY files/* /opt/

RUN tar xzfp /opt/softether.tar.gz -C /opt && \
    rm -f /opt/softether.tar.gz
RUN cd /opt/vpnserver && \
    ls -hal && \
    uname -a && cat /etc/os-release && \
    #make i_read_and_agree_the_license_agreement
    make

RUN chmod 755 /opt/*.sh

#ENTRYPOINT /bin/bash
ENTRYPOINT /opt/start.sh
