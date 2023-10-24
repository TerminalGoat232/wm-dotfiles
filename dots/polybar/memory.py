#!/usr/bin/env python3
import psutil
from time import *
un = 1028 << 20
cc = [
f"   {str(psutil.swap_memory().used/(un))[:6]} / {str(round(psutil.swap_memory().total/(un)))}GB "]
#f" {str(psutil.virtual_memory().used/(un))[:3]} / {str(psutil.virtual_memory().total/(un))[:3]}GB "]
for cock in cc:print(cock,end=" ");sleep(1)
