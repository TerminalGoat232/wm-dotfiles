#!/usr/bin/env python3
import psutil as ps 
from time import *
t = ps.sensors_temperatures()
print(f" {''+str(t['coretemp'][1].current)+'°C'}",end='')


