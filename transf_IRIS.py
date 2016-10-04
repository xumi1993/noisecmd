#!/usr/bin/env python

import os
import sys
import glob

ddir = sys.argv[1]
for day in glob.glob(ddir+"/*/raw_data"):
