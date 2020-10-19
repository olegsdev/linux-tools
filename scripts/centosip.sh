#!/bin/bash

ip=$1
hostname=$2
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
BOOTPROTO=static
ONBOOT=yes
TYPE=Ethernet
HOSTNAME=$hostname
IPADDR=$ip
PREFIX=24
GATEWAY=172.20.10.1
DNS1=9.9.9.9
DNS2=1.1.1.1
EOF

