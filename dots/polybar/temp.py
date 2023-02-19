#!/usr/bin/env python3
import psutil as ps 
from time import *
t = ps.sensors_temperatures()
for x in t:
	if x == "coretemp":
                h = f"   {'['+t[x][1].label[5:]+'] > '+str(t[x][1].current)+'°C'}"
                #+'  '+str(t[x][1].critical)+'°C '}"
                print(h,end='')
                sleep(2)