#!/bin/bash

if [ -z $1 ]; then
  echo "usage:`basename:` $0 image-file"
  exit 1
fi

if [ -f .swiftrc ]; then
  source .swiftrc
else
  echo "swift credentials not available"
  exit 1
fi

IMAGE=$1
SIZE=`ls -l $IMAGE | awk '{print $5}'`

swiftcmd="swift -A $OS_AUTH_URL -U ${OS_TENANT_NAME}:${OS_USERNAME} -K $OS_PASSWORD"

CONTAINER='images'

$swiftcmd upload -S 209715200 $CONTAINER $IMAGE

REMOTE_SIZE=`$swiftcmd stat $CONTAINER $IMAGE | grep Length | cut -d: -f2 | tr -d ' '`

if [ $REMOTE_SIZE == $SIZE ]; then
  echo "$IMAGE Uploaded successfully to $CONTAINER"
  exit 0
else
  echo "$IMAGE has not uploaded properly, please retry"
  exit 1
fi
