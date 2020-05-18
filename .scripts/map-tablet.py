#!/usr/bin/env python

import sys
import re

pattern = re.compile("id=[0-9]+")

def has(check, line):
    if check in line:
        return True
    else:
        return False

def get_id(line):
    if line is None:
        return None
    group = pattern.search(line).group(0)
    if group is not None:
        return group.split("=")[1]
    else:
        return None


for line in sys.stdin:
    if has("Pen", line) and has("HID", line):
        print(get_id(line))
    if has("Pad", line) and has("HID", line):
        print(get_id(line))

