#!/bin/bash

BASE_DIR="/opt/vpnserver"
CONFIG_DIR="/config"
LOG_DIR="/log"

[ -z $VERBOSE ] && { VERBOSE="yes"; }

# prestart vpn server
$BASE_DIR/vpnserver start
sleep 1
$BASE_DIR/vpnserver stop

# config
[ -d $CONFIG_DIR ] || { mkdir -p $CONFIG_DIR; }
echo "Preconfiguring config files..."
[ -d $BASE_DIR/backup.vpn_server.config ] && { mv $BASE_DIR/backup.vpn_server.config $CONFIG_DIR && ln -sf $CONFIG_DIR/backup.vpn_server.config $BASE_DIR; }
[ -d $BASE_DIR/chain_certs ] && { mv $BASE_DIR/chain_certs $CONFIG_DIR && ln -sf $CONFIG_DIR/chain_certs $BASE_DIR; }
[ -f $BASE_DIR/vpn_server.config ] && { mv $BASE_DIR/vpn_server.config $CONFIG_DIR && ln -sf $CONFIG_DIR/vpn_server.config $BASE_DIR; }

# log
[ -d $LOG_DIR ] || { mkdir -p $LOG_DIR; }
for logf in $BASE_DIR/*_log
do
  [ -d $logf ] && { mv $logf $LOG_DIR && ln -sf $LOG_DIR/$( basename $logf ) $BASE_DIR; }
done

# basic config
$BASE_DIR/vpncmd RemoteEnable

# start vpn service
$BASE_DIR/vpnserver start

# something daemon like stuff
[ $VERBOSE == "no" ] && { /bin/bash; } || { tail -f $LOG_DIR/server_log/*.log; }
