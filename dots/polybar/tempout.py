#!/usr/bin/env python3
from os import *
from datetime import datetime as dt
import urllib.request
from time import *
from dataclasses import dataclass
h=''
l=''
region='thua-thien'
region2=f"https://wttr.in/{region}?format=2"
try:
	with urllib.request.urlopen(region2) as h:
		try: 
			l=h.read().decode(h.headers.get_content_charset())
		except:print('manjg ngu')
except:pass
wthalist=['⛅','☁','🌦','⛈','🌨','🌩','🌫','🌧']
wthareplacement=['','摒','','','殺','摒','','']
@dataclass
class wther:
	ll:list
	weather: str = ""
	t:int = int(dt.now().strftime('%H'))
	def __post_init__(self):
		for x in l:self.ll.append(x)
		for y in range(0,len(wthalist)):
			if wthalist[y]=="".join(self.ll[:1]) and self.t in range(18,24):
				self.weather=" 望 "+wthareplacement[y]
			elif wthalist[y]=="".join(self.ll[:1]) and self.t in range(0,7):
				self.weather="  "+wthareplacement[y]
			elif wthalist[y]=="".join(self.ll[:1]) and self.t in range(7,13):
				self.weather=" 滛 "+wthareplacement[y]
			elif wthalist[y]=="".join(self.ll[:1]) and self.t in range(13,18):
				self.weather=" 漢 "+wthareplacement[y]
		self.temp="  "+"".join(self.ll[6:13])
	def getWeather(self):return self.weather
	def getTemperature(self):return self.temp
if __name__ == "__main__":
	m = wther([])
	sleep(5)
	print(m.getWeather(),m.getTemperature(),end="")
