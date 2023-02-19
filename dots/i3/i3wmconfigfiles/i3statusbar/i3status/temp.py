#!/usr/bin/env python3
import psutil as ps 
t = ps.sensors_temperatures()
for x in t:
	if x == "coretemp":
		h = f"🌡 {t[x][1].label+': '+str(t[x][1].current)+'°C'+' / Critical: '+str(t[x][1].critical)+'°C'}"
		print(h,end='')