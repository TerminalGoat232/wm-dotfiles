#!/usr/bin/env python3
import psutil
from time import *
cc = [
#f" %: {psutil.virtual_memory().percent}%",
f"   {str(psutil.swap_memory().used/(2048**2+1024**3))[:6]}",
f"/ {str(round(psutil.swap_memory().total/(2048**2+1024**3)))} GB",
f" {str(psutil.virtual_memory().used*10**-6.02419)[:6]}",
f"/ {str(psutil.virtual_memory().total*10**-6.02419)[:6]} MB", ]
#f"%: {str(psutil.virtual_memory().available * 100 / psutil.virtual_memory().total)[:4]}"]
for cock in cc:print(cock,end=" ");sleep(1)