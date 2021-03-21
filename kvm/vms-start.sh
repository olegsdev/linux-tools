#!/bin/bash

#Start all previously running vms 
for VM in $(cat /tmp/vms-were-running.log)
do
  virsh start "$VM"
done
