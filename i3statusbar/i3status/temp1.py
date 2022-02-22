#!/usr/bin/env python3
import psutil as ps 
t = ps.sensors_temperatures()
for x in t:
	if x == "coretemp":
		h = f"🌡 {t[x][2].label+': '+str(t[x][2].current)+'°C'+' / Critical: '+str(t[x][2].critical)+'°C'}"
		print(h,end='')