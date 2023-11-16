#!/bin/bash
v="$1"
m() {  
 k=`python3 ~/.config/eww/ytsearch.py ${v} --yt-url`
 cvlc --play-and-exit ${k} --no-video --h264-fps=1
}
m

