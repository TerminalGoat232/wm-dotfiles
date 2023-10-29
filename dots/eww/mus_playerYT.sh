#!/bin/bash
v="$1"
m() {#echo $VAR  
 local k=`python3 ~/.config/eww/ytsearch.py ${v}`
 cvlc --play-and-exit ${k} --no-video --h264-fps=1
}
m

