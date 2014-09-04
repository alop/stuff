#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: `basename $0` image"
  exit 1
fi

IMAGE=$1
MP="/mnt/test"

if [ ! -d $MP ] ; then
  mkdir $MP
fi

# Load kernel module
modprobe nbd

# Look for next available device
COUNT=`lsblk | grep disk | grep -c nbd`
# connect (read-only) to next available device
qemu-nbd -r -c /dev/nbd${COUNT} $IMAGE

mount -o ro /dev/nbd${COUNT}p1 $MP

# Begin tests

function cleanup() {
  umount $MP
  qemu-nbd -d /dev/nbd${COUNT}
}

trap "cleanup" EXIT

chroot $MP /bin/bash --noediting -i <<'END_TESTS'
unset PS1

function error_exit() {
  echo -e "\E[31mTest $TEST failed\E[0m"
  exit 1
}

function success_exit() {
  echo -e "\E[32m $TEST OK\E[0m"
}

trap "error_exit" ERR
trap "success_exit" SIGCHLD

TEST="Check for serial console"
if [ -e /boot/grub2/grub.cfg ]; then
  GRUB_CFG="/boot/grub2/grub.cfg"
else
  GRUB_CFG="/boot/grub/grub.cfg"
fi

grep -q console=ttyS0 $GRUB_CFG

TEST="Check for key-based ssh auth"
grep PasswordAuthentication /etc/ssh/sshd_config | grep -qi no || grep ssh_pwauth /etc/cloud/cloud.cfg | grep -q 0

TEST="Check for UTC timezone"
grep -q UTC /etc/localtime

TEST="Check for chrony"
which chronyc

TEST="Check for cloud-user"
grep -q cloud-user /etc/cloud/cloud.cfg

TEST="Check for puppet client"
which puppet

END_TESTS
