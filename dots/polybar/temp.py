#!/usr/bin/env python3
import psutil as ps 
from time import *
t = ps.sensors_temperatures()
h = f" {''+str(t['coretemp'][1].current)+'°C'}"
#+'  '+str(t[x][1].critical)+'°C '}"
print(h,end='')
sleep(2)
