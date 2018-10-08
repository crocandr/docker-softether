FROM debian

ENV DOWNLOAD_URL https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.28-9669-beta/softether-vpnserver-v4.28-9669-beta-2018.09.11-linux-x64-64bit.tar.gz

RUN apt-get update && apt-get install -y curl tar gzip grep make gcc cpp
RUN curl -L -o /opt/softether.tar.gz $DOWNLOAD_URL && tar xzfp /opt/softether.tar.gz -C /opt 
RUN cd /opt/vpnserver && make i_read_and_agree_the_license_agreement 

COPY files/start.sh /opt/start.sh
RUN chmod 755 /opt/*.sh

#ENTRYPOINT /bin/bash
ENTRYPOINT /opt/start.sh
