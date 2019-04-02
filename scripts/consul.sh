#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
IPs=$(hostname -I)
HOST=$(hostname)

sudo killall consul
sudo mkdir -p /etc/consul.d/ /opt/consul/

# ###########################
# # Starting consul servers #
# ###########################
if [[ $IPs =~ 172.31.16 ]]; then # if 172.31.16 it is dc1
    DC_RANGE_OP="172.31.32"
    DC_RANGE="172.31.16"
    DC=sofia
elif [[ $IPs =~ 172.31.32 ]]; then  # if 172.31.32 it is dc2
    DC_RANGE_OP="172.31.16"
    DC_RANGE="172.31.32"
    DC=varna
else 
    DC_RANGE_OP="172.31.32"
    DC_RANGE="172.31.48"
    DC=dc3
fi   

NODE_TYPE=client

if [[ $HOST =~ ip-172-31-16-1 ]]; then
  # if the name contain server we are there
  NODE_TYPE=server
fi
# Cloud Auto-joining 
LAN=", \"retry_join\": [ \"provider=aws tag_key=consul tag_value=app\" ]"
# Joining with private IPs
# LAN=", \"retry_join\": [ \"$DC_RANGE.11\", \"$DC_RANGE.12\", \"$DC_RANGE.13\" ]"
WAN=", \"retry_join_wan\": [ \"$DC_RANGE_OP.11\", \"$DC_RANGE_OP.12\", \"$DC_RANGE_OP.13\" ]"
  

sudo cat <<EOF > /etc/consul.d/config.json
{ 
  "datacenter": "${DC}",
  "ui": true,
  "client_addr": "0.0.0.0",
  "bind_addr": "0.0.0.0",
  "advertise_addr": "${IPs}",
  "enable_script_checks": true,
  "data_dir": "/opt/consul"${LAN}${WAN}
}
EOF

sudo chown -R consul:consul /etc/consul.d/
sudo chmod -R 775 /etc/consul.d/

###################
# Starting Consul #
###################
sudo systemctl daemon-reload
sudo systemctl start consul

###########################
# Redirecting conslul log #
###########################
    if [ -d /opt/consul ]; then
        mkdir -p /opt/consul/consul_logs
        journalctl -f -u consul.service &> /opt/consul/consul_logs/${HOST}.log &
    else
        journalctl -f -u consul.service > /tmp/consul.log
    fi
echo consul started
set +x
sleep 10
consul members

