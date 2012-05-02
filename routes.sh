#!/usr/bin/env bash

# Setting up static routes to send some traffic over the WiFi at ATT Center

if [ $( whoami ) != "root" ]; then
        echo "You must be root to run this script"
        exit 1
fi

WIFIGW="206.117.88.1"

# Make imap.gmail.com work
route add -net 173.194.79.0/24 $WIFIGW

# Send traffic to jump hosts over the wifi too
# ewr1 network
route add -net 75.62.56.0/24 $WIFIGW

# iad1 network
route add -net 64.143.224.0/24 $WIFIGW

#san1/san2 network
route add -net 75.55.64.0/24 $WIFIGW
route add -net 75.55.68.0/24 $WIFIGW

#dfw1 network
route add -net 75.55.96.0/24 $WIFIGW

