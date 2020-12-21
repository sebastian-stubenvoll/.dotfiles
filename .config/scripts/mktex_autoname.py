#!/usr/bin/env python3
import os
from datetime import datetime
now = datetime.now()
name = now.strftime("%Y-%m-%d_%H%M")
home = os.path.expanduser("~")
notedir = "{}/Documents/Notes/".format(home)
cmd = "{}/.config/scripts/mktex.sh {}".format(home,name)

if not os.path.isdir(notedir):
    os.makedirs(notedir)

os.chdir(notedir)
os.system(cmd)
