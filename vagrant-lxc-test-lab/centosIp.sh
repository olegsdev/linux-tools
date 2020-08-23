#!/bin/bash

IP=$1
cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
BOOTPROTO=none
ONBOOT=yes
NM_CONTROLLED=no
TYPE=Ethernet
IPADDR=$IP
PREFIX=24
GATEWAY=10.0.3.1
DNS1=9.9.9.9
DNS2=1.1.1.1
EOF
