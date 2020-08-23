#!/bin/bash

IP=$1
cat <<EOF > /etc/netplan/10-lxc.yaml
network:
  version: 2
  ethernets:
    eth0:
      dhcp4: no
      addresses:
        - $IP/24
      gateway4: 10.0.3.1
      nameservers:
          addresses: [9.9.9.9, 1.1.1.1]
EOF
