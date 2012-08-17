#!/usr/bin/env bash
# Little ditty to make sure that the stuff we think should be running actually
# is running

INSTANCE_DIR="/var/lib/nova/instances/"

cd $INSTANCE_DIR
ASSIGNED=( $(ls -d instance*) )
RUNNING=( $(virsh -q list | awk '{print $2}') )

# Lets first count to see if ASSIGNED == RUNNING

if [[ ${#ASSIGNED[@]} -eq ${#RUNNING[@]} ]]; then
  echo "Everything is running ok"
  exit 0
  else
    echo "Something is not right"
    exit 1
fi
