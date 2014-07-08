#!/bin/bash
MY_GW=`netstat -rn -f inet | grep default | grep -v utun | awk '{print $2}'`

for i in `cat reroute | grep -v "#"`
  do
    sudo route add -net $i $MY_GW
done

