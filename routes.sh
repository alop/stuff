#!/usr/bin/env bash

# Setting up static routes to send some traffic over the WiFi at ATT Center

if [ $( whoami ) != "root" ]; then
        echo "You must be root to run this script"
        exit 1
fi

WIFIGW="192.168.1.1"

networks=("64.143.224.0/20" "75.62.60.0/22" "207.97.227.0/24" "12.208.176.0/24" "173.194.79.0/24" "75.62.56.0/24" "64.143.224.0/24" "75.55.64.0/24" "75.55.68.0/24" "75.55.96.0/24" )

case $1 in
up)
for i in ${networks[@]}
do
route add -net $i $WIFIGW
done
;;

down)
for i in ${networks[@]}
do
route delete -net $i $WIFIGW
done
;;
*)
echo "Usage: $0 [up|down]"
exit 1
;;
esac

