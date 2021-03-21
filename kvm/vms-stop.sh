#!/bin/bash

#date_now=$(date "+%F_%H-%M")

#list running vm
echo "" > /tmp/vms-were-running.log

#Get all running vms
for VM in $(virsh list --state-running --name); do
  if [[ ! "$VM" == "VM-TO-NOT-SHUTDOWN" ]] ; then
    virsh shutdown "$VM"
    #Save list of running vms for start script
    echo "$VM" >> /tmp/vms-were-running.log
  fi
done
