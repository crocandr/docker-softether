FROM debian:latest

COPY files/* /opt/

RUN apt-get update && \
    apt-get install -y curl tar gzip grep make gcc cpp
RUN tar xzfp /opt/softether.tar.gz -C /opt && \
    rm -f /opt/softether.tar.gz
RUN cd /opt/vpnserver && \
    ls -hal && \
    #make i_read_and_agree_the_license_agreement
    make 

RUN chmod 755 /opt/*.sh

#ENTRYPOINT /bin/bash
ENTRYPOINT /opt/start.sh
