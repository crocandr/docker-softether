# SoftEther

My basic SoftEther VPN Server container.

  - https://www.softether.org
  
# Usage

The recommended way is docker-compose.

VERY IMPORTANT!: Create an empty config file with world-wide write permission under the config folder before start the server:
```
mkdir config
touch config/vpn_server.config
chmod 777 config/vpn_server.config
```

Start the container:

```
docker-compose up -d
```

# Remote Management

  - start the VPN server
  - connect to the server with SoftEther Server Manager Tool from Windows or macOS
  
Notice:
sometimes the default 443 port is used by another service, so use another available port like 5555, 8888...

