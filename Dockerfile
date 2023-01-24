FROM debian:10

ENV DOWNLOAD_URL https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.31-9727-beta/softether-vpnserver-v4.31-9727-beta-2019.11.18-linux-x64-64bit.tar.gz

RUN apt-get update && \
    apt-get install -y curl tar gzip grep make gcc cpp
RUN tar xzfp /opt/softether.tar.gz -C /opt && \
    rm -f /opt/softether.tar.gz
RUN cd /opt/vpnserver && \
    ls -hal && \
    uname -a && cat /etc/os-release && \
    #make i_read_and_agree_the_license_agreement
    make

COPY files/* /opt/
RUN chmod 755 /opt/*.sh

#ENTRYPOINT /bin/bash
ENTRYPOINT /opt/start.sh
