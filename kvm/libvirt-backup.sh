#!/bin/bash

# Simple script for kvm virtual machines backups.
# better options to use:
#		https://github.com/eslam-gomaa/virt-backup
#		https://gist.github.com/cabal95/e36c06e716d3328b512b


dataVar=`date +%F`

#directory reserved for backups
dir1=/var/backups/kvm/ 

#default KVM virtual storage location
dir2=/var/lib/libvirt/images/


for vmname in $(virsh list --state-running --name)
  do
    virsh dumpxml ${vmname} > ${dir1}${vmname}.xml
    tar -zcf ${dir1}${vmname}_${dataVar}.tar.gz ${dir1}${vmname}.xml ${dir2}${vmname}.qcow2
    rm -f ${dir1}${vmname}.xml 
    echo "backup ${vmname} is ready!"
  done

