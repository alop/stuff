#!/usr/bin/env python
# Going to try this in python, as shell arrays aren't that easy
# Pseudocode in comments and such

import os
import libvirt
import sys

# gotta find out how many instances *should* be there
# look in the nova dir

instance_dir = '/var/lib/nova/instances/'
instances = os.listdir( instance_dir )
assigned=[]
for i in instances:
  if i.startswith('instance-'):
    assigned.append(i)

#print assigned

# connect to libvirt to find out how many instances are
# *actually* running

virt = libvirt.openReadOnly(None)
if virt == None:
  print 'Failed to talke to hypervisor'
  sys.exit(1)

try:
  doms = virt.numOfDomains()

if doms == len(assigned):
  print "Everything is OK"
  sys.exit(0)
# Compare assigned vs running
# If same, exit 0, else, try to define and start failed instances
