#!/bin/bash

for i in `cat reroute | grep -v "#"`
  do
    sudo route add -net $i 10.0.1.1
done

