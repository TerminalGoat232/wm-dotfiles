#!/bin/bash
#sed -i "9d" $HOME/.config/polybar/tempout.py && sed -i "9i\region='$1'" $HOME/.config/polybar/tempout.py && eww close changeloc
sed -i "2d" ~/.config/eww/scripts/weather_status.sh && sed -i "2i\region='$1'" ~/.config/eww/scripts/weather_status.sh && eww close changeloc
