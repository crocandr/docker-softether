FROM debian

ENV DOWNLOAD_URL https://www.softether-download.com/files/softether/v4.29-9680-rtm-2019.02.28-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.29-9680-rtm-2019.02.28-linux-x64-64bit.tar.gz

RUN apt-get update && apt-get install -y curl tar gzip grep make gcc cpp
RUN curl -L -o /opt/softether.tar.gz $DOWNLOAD_URL && tar xzfp /opt/softether.tar.gz -C /opt 
RUN cd /opt/vpnserver && make i_read_and_agree_the_license_agreement 

COPY files/* /opt/
RUN chmod 755 /opt/*.sh

#ENTRYPOINT /bin/bash
ENTRYPOINT /opt/start.sh
