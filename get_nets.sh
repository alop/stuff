#!/bin/bash

IP=$1
ARIN_CMD="./arinr/bin/arininfo"
HANDLE=`$ARIN_CMD --data terse -t ip4addr $IP | grep "Organization Handle" | cut -d: -f2`

if [ -z "$HANDLE" ]
  then
  echo `$ARIN_CMD --data extra -t ip4addr $IP | grep CIDR | cut -d: -f2 | awk '{print $1}'`
  exit 0
fi

for i in `$ARIN_CMD --data terse -t orghandle $HANDLE -r nets | cut -d= -f2 | awk '{print $1}' | grep -v NET6 | grep -v "#"`
  do
    echo `$ARIN_CMD --data extra -t nethandle $i | grep CIDR | grep -v Parent | cut -d: -f2 | awk '{print $1}'` 
done
