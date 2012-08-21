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

doms = virt.numOfDomains()

def find_missing_domain():
  missing = virt.listDefinedDomains()
  return missing

def define_missing_domain(domid):
  conf = instance_dir + domid + "/libvirt.xml"
  f = open(conf)
  xml = f.read()
  virt2 = libvirt.open(None)
  virt2.defineXML(xml)
  dom = virt2.lookupByName(domid)
  dom.create()

# Compare assigned vs running
# If same, exit 0, else, try to define and start failed instances
if doms == len(assigned):
  print "Everything is OK"
  sys.exit(0)
else:
  print "Something is wrong"
  miss_dom = find_missing_domain()
  print miss_dom
  print "Trying to define missing domain"
  #define_missing_domain( miss_dom )


