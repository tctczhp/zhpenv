import os
import time
import sys

cpath = os.path.abspath('.')
cfs = os.listdir(cpath)

while 'hprun.sh' not in cfs and cpath != '/':
    cpath = os.path.abspath(os.path.join(cpath,'..'))
    cfs = os.listdir(cpath)

if 'hprun.sh' in cfs:
    os.chdir(cpath)
    r = os.system('bash hprun.sh')
else:
    print('Error: No `hprun.sh` found in current or parent dirs.')
    r = 0

if r == 0:
    time.sleep(2)
else:
    while True:
        pass
