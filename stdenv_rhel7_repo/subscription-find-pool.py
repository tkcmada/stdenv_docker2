#!/usr/bin/python

import sys
import re

p1 = r".+Red Hat Enterprise Linux Server.+"
p2 = r"Pool ID: +"
found = False
for line in sys.stdin:
  line = line.rstrip()
  if re.match(p1, line):
    found = True
  if found and re.match(p2, line):
    pool = re.sub(p2, '', line)
    sys.stdout.write(pool)
    exit(0)
print('Red Hat Enterprise Linux Server subscription is not found.')
exit(1)

