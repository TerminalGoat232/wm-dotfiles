from tempout import *
t2=wther([]).getRTemp()
t1=wther([]).getATemp()
print("糖",int(t2[0:len(t2)-2])-int(t1[0:len(t1)-2]))
