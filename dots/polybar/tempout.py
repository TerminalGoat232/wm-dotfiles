#!/usr/bin/env python3
from os import *
from datetime import datetime as dt
import urllib.request
from time import *
from dataclasses import dataclass
get_dat_from_url=''

region='insert ur region here'

try:
	with urllib.request.urlopen(f"https://wttr.in/{region}?format=%t+%f+%c+%h+%w+%P+%u+%m+%M+%p") as h: get_dat_from_url=h.read().decode(h.headers.get_content_charset())
except:print('shit gone wrong')
wthalist=       ['⛅','☁','🌦','⛈','🌨','🌩','🌫','🌧','☀']
wthareplacements=['','󰅟','','󰙾','󰼶','󰖓','','','']
@dataclass
class wther:
	main_dat:list
	weather: str = ""
	time:int = int(dt.now().strftime('%H'))
	def __post_init__(self):
		self.main_dat=get_dat_from_url.split()
		for y in range(0,len(wthalist)):
			if wthalist[y] in self.main_dat[2] and self.time in range(18,24):
				self.weather=" 望 "+wthareplacements[y]
			elif wthalist[y] in self.main_dat[2] and self.time in range(0,7):
				self.weather="  "+wthareplacements[y]
			elif wthalist[y] in self.main_dat[2] and self.time in range(7,13):
				self.weather=" 滛 "+wthareplacements[y]
			elif wthalist[y] in self.main_dat[2] and self.time in range(13,18):
				self.weather=" 漢 "+wthareplacements[y]
		self.temp=" "+self.main_dat[0]+" ["+self.main_dat[1]+"] "
	def getWeather(self):return self.weather
	def getATemp_RFeel(self):return self.temp
	def getATemp(self):return self.main_dat[0]
	def getRTemp(self):return self.main_dat[1]
	def getHumidity(self):return self.main_dat[3]
	def getWindCond(self):return self.main_dat[4]
	def getAirPressure(self):return self.main_dat[5]
	def getUVindx(self):return self.main_dat[6]
	def getMoonPhase(self):return self.main_dat[7]
	def getMoonDay(self):return self.main_dat[8]
	def getPrecipitation(self):return self.main_dat[9]
if __name__ == "__main__":
	try:
		m = wther([])
		print(m.getWeather(),m.getATemp_RFeel(),end="")
	except:pass
	sleep(5)

