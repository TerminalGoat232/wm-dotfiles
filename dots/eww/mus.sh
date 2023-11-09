#!/bin/bash
#written in half-bash / half-fish so it's pretty damn weird irk
title(){
	local tt
	local cc
	local ma
	tt=`playerctl metadata --format ' {{ title }} ' 2>/dev/null`
	cc=${#tt}
	[[ ${cc} -gt 20 ]] && echo ${tt::$cc-($cc-20)} || echo ${tt}
}

full_title_with_scrolling(){
  local c
  tt=`playerctl metadata --format ' {{ title }} ' 2>/dev/null`
  l=${#tt} 

  #echo ${c}
   
  r=$((${l} / 3))
   if [[ ${#tt} -lt 25 ]]; then echo "$tt"
  else
    for (( k=1;k<${l}-2;++k)); do
       c+=" "
    done
    tt+=${c}
    tt=${c::5}${tt} 
    (echo "$tt" | zscroll -n true -l 10 -d 0.15 -t $((${r} - 5)) & wait )
  fi 
}
title_and_stuff(){
	local zx,c,zy,zz,st,mm,i
	zx=`playerctl metadata --format ' {{ title }} '`
	# zy=`playerctl metadata --format ' {{ artist }} '`
	zz=`playerctl metadata --format '{{ status }}'`
	st=""
	c=${#zx}
	[[ ${zz} == "Paused" ]] && st="⠀󰒮⠀⠀  ⠀⠀󰒭" || st="⠀󰒮⠀⠀  ⠀⠀󰒭"
	[[ ${#zx} -gt 28 ]] && echo ${st} "\n"${zx::$c-($c-28)}"...⠀⠀⠀" || {
		for (( i=0;i<(32-${c});++i )); do 
			mm+="⠀"
		done
		echo ${st} "\n"""${zx}${mm::$c-($c-18)}
	}
}
artist(){
	local ar
	local al
	local n
	local m
	ar=`playerctl metadata --format ' {{ artist }} '`
	al=${#ar}
	[[ ${al} -gt 12 ]] && echo "⠀󰎈⠀"${ar}"⠀" || echo "⠀󰎈 ""${ar}"
}
img(){
	local m 
	m=`playerctl metadata --format "{{mpris:artUrl}}"`
	[[$m -eq ""]] && echo "placeholderart.png" || echo ${m:7}
}

if [[ "$1" == "--img" ]]; then
	img
elif [[ "$1" == "--title" ]]; then
	title_and_stuff
elif [[ "$1" == "--title_only" ]]; then
	title
elif [[ "$1" == "--artist_only" ]]; then
	artist
elif [[ "$1" == "--duration" ]]; then
	duration
elif [[ "$1" == "--title_scroll" ]]; then 
  full_title_with_scrolling
fi
