#!/bin/bash

BASE_DIR="/opt/vpnserver"

# first start 
if [ -s $BASE_DIR/vpn_server.config ]
then
  echo "Config exists."
else
  echo "Config not exists, creating a basic configuration..."
  $BASE_DIR/vpnserver start
  sleep 2 
  $BASE_DIR/vpnserver stop
  # basic config for remote management
  $BASE_DIR/vpncmd RemoteEnable
fi

# start vpn service
$BASE_DIR/vpnserver start

# something daemon like stuff
tail -f $BASE_DIR/server_log/*
