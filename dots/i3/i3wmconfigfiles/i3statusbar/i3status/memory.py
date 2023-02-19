#!/usr/bin/env python3
import psutil
cc = [
f"RAM %: {psutil.virtual_memory().percent}% ▶",
f"RAM AVAILABLE : {str(psutil.virtual_memory().available*1.0e-6)[:6]}MB ▶", 
f"RAM AVAILABLE%: {str(psutil.virtual_memory().available * 100 / psutil.virtual_memory().total)[:4]}"]
for cock in cc:
	print(cock,end=" ")