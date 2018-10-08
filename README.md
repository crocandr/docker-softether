# SoftEther

My basic SoftEther VPN Server container.

  - https://www.softether.org
  
# Usage

The recommended way is docker-compose.

```
docker-compose up -d
```

# Remote Management

  - start the VPN server
  - connect to the server with SoftEther Server Manager Tool from Windows or macOS
  
Notice:
sometimes the default 443 port is used by another service, so use another available port like 5555, 8888...
