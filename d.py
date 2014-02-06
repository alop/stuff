#!/usr/bin/env python

import sys
import json
import httplib2
import getopt

import dynect
from dynect import *



dyn = Dynect('att-services', '560iJs-robot', 'MooCowRobot')
dyn.add_a_record('dev.sl.attcompute.com', FQDN, IP, 30)
