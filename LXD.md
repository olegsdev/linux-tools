**Linux containers** often considered as something in the middle between a chroot and a full fledged virtual machine. The goal of LXC is to create an environment as close as possible to a standard Linux installation but without the need for a separate kernel.  
**LXD** is a system container and virtual machine manager. It offers a unified user experience around full Linux systems running inside containers or virtual machines.

Before start, use ```lxd init``` to configure LXD settings such as network, storage, clustering and other. All of them can be changed later.

## Get Info:
```bash
lxc profile show default
lxc info container_name
lxc config show ansible-test1 -e  #all configurations
lxc storage list

lxc ls #List instances
lxc list -c ns4mDSb

All available column options:
    4 - IPv4 address
    6 - IPv6 address
    a - Architecture
    b - Storage pool
    c - Creation date
    d - Description
    D - disk usage
    l - Last used date
    m - Memory usage
    M - Memory usage (%)
    n - Name
    N - Number of Processes
    p - PID of the instances init process
    P - Profiles
    s - State
    S - Number of snapshots
    t - Type (persistent or ephemeral)
    u - CPU usage (in seconds)
    L - Location of the instance (e.g. its cluster member)
    f - Base Image Fingerprint (short)
    F - Base Image Fingerprint (long)

```

## Launch new container
```bash
lxc launch images:centos/7/amd64 container_name
lxc launch ubuntu:20.04 container_name
lxc launch -p profile_name ubuntu:20.04 container_name   #-p for applying a profile
```

## Configuration
Apply specific settings to a container:

```bash
lxc config set container_name limits.memory 512MB
lxc config set container_name limits.cpu 2
lxc config device set container_name root size 10GB
lxc config device set container_name eth0 limits.ingress 1Mbit
```

## Run commands within container
```bash
lxc exec container_name -- /bin/bash #Get a shell inside a container as a root
lxc exec container_name bash
lxc exec container_name -- su --login username
lxc console container_name  # terminal inside container, use ```ctrl+a-q``` for detach.
```


## Profile
Profile helps create container preconfiguration. Can be apply in launch moment. Uses [cloud-init](https://cloudinit.readthedocs.io/en/latest/) initialization.
```bash
lxc profile create profilename
lxc profile edit profilename

# example
oleg@t600:~$ lxc profile show dev1 
config:
  limits.cpu: "1"
  limits.memory: 1024MB
  user.user-data: |
    #cloud-config
    package_upgrade: true
    timezone: America/Los_Angeles
    # User setup
    users:
     - name: oleg
       ssh-authorized-keys:
         - ssh-rsa AAAA......== oleg@t800
       sudo: ['ALL=(ALL) NOPASSWD:ALL']
       groups: sudo
       shell: /bin/bash
description: dev environment for tests
devices:
  eth0:
    nictype: bridged
    parent: br0
    type: nic
  root:
    path: /
    pool: zfs-pool
    type: disk
name: dev1
used_by:
- /1.0/instances/nodejs
...

```


## Network
```bash
#Create bridge:
lxc network create testbr0 ipv6.address=none ipv4.address=none
lxc network create dev1br0 ipv6.address=none ipv4.address=172.20.5.10/24 ipv4.nat=true

#containers get IP from your LAN using a bridge. Profile:
devices:
  eth0:
    nictype: bridged
    parent: br0
    type: nic
https://blog.simos.info/how-to-make-your-lxd-containers-get-ip-addresses-from-your-lan-using-a-bridge/

#containers get IP from your LAN using macvlan
lxc profile device add dev1 eth0 nic nictype=macvlan parent=br0
https://blog.simos.info/how-to-make-your-lxd-container-get-ip-addresses-from-your-lan/

#Set static ip (stop container before):
lxc network attach lxdbr0 container_name eth0 eth0
lxc config device set container_name eth0 ipv4.address 192.168.10.5

```

## Snapshots
```bash
lxc snapshot container_name snapshot_name # reate the snapshot
lxc restore container_name snapshot_name # restore the snapshot
lxc delete container_name/snapshot_name  # delete a snapshot
```

## Files
```bash
lxc file pull container_name/path-in-container path-on-host  #from an instance to host
lxc file pull -r container_name/path-in-container path-on-host  # Pull a folder
lxc file push path-on-host container_name/path-in-container   #  from host to instance
lxc file push -r path-on-host container_name/path-in-container  # folder
```

## Storage
```bash
lxc storage create NAME type source=/some/empty/directory
lxc storage create zfs-pool zfs source=/dev/mapper/vg_lxd-lv_lxd_zfs
lxc storage list  
lxc storage show zfs-pool
https://linuxcontainers.org/lxd/docs/master/storage
```


## Export & import(or backups), publish
```bash
lxc export container_name /tmp/container_name_date.tar.gz
lxc import container_name_date.tar.gz 

#Publish - turns a container or snapshot into an image in the local LXD image store
lxc publish container_name/snapshot --alias new_local_image
lxc publish container_name --alias image_name

lxc image import container_name.tar.gz  --alias custom-imagename
lxc image export imagename [target folder] [flags]

#https://discuss.linuxcontainers.org/t/backup-the-container-and-install-it-on-another-server/463
```


## Privileges
Set special privileges for container, this example is for NFS:
```bash
lxc config set container_name security.privileged true
lxc config set container_name raw.apparmor "mount fstype=nfs,"
```


## Recommendations 
Use this alias to prevent accidental deletion of an container.  
```lxc alias add delete "delete -i"```

## Gui
- LXDUI - https://github.com/AdaptiveScale/lxdui
- LXD Mosaic - https://github.com/turtle0x1/LxdMosaic


## Source
- https://linuxcontainers.org/lxd/advanced-guide/
- https://linuxcontainers.org/lxd/docs/master/index