#!/usr/bin/env bash

# Bootstrap script to install boinc on a new VM, and attach to my projects

OS=`uname -s`

if [ $OS = "Linux" ]; then
  #Look for what distro I'm on
    if [ -f /etc/redhat-release ]; then
     INSTALLER="yum"
    elif [ -f /etc/debian_version ]; then
     INSTALLER="apt-get"
    fi
else
  echo "I only know how to do this on linux systems"
  exit 1
fi

$INSTALLER -y install boinc-manager

boinc_client --daemon
boincmd --project_attach http://worldcommunitygrid.org 00200f2e077e2a04ddaa9acfd8be09e2
