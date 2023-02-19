import os
from pynput.keyboard import Controller, Listener, Key
import alsaaudio as al
class vol_:
	def __init__(self):	
		self.c1 = [Key.ctrl,Key.left,Key.right]
		self.h = 0
		self.main_vol=al.Mixer().getvolume()[:-1][0]
	def press(self,k):
		if k==self.c1[0]: self.h=1
		if self.h==1 and k==self.c1[1]: self.decrease_vol()
		if self.h==1 and k==self.c1[2]: self.raise_vol()
	def release(self,k):
		if k==self.c1[0]: self.h=0	
	def raise_vol(self):
	    self.main_vol+=1
	    os.system(
	        "pactl set-sink-volume @DEFAULT_SINK@ {0}%".format(self.main_vol)
	        )
	def decrease_vol(self):
	    self.main_vol-=1
	    os.system(
	        "pactl set-sink-volume @DEFAULT_SINK@ {0}%".format(self.main_vol)
	        )
if __name__ == "__main__":
	v = vol_()
	with Listener(on_press=v.press,on_release=v.release) as l:l.join()
# h_keys = {
#     "<shift>+z":raise_vol,
#     "<shift>+x":decrease_vol
# }
# with kb.GlobalHotKeys(
#    h_keys
# ) as k: k.join()
