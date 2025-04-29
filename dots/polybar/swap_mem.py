#!/usr/bin/env python3
import psutil
divisor = 1028 << 20
swap_mem = psutil.swap_memory()
print(f"   {str(swap_mem.used/divisor)[:6]} / {round(swap_mem.total/(divisor))}GB ",end=' ')
