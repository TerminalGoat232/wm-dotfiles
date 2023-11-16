
#!/bin/bash

tt=`playerctl metadata --format ' {{ title }} ' 2>/dev/null`
ar=`playerctl metadata --format ' {{ artist }} ' 2>/dev/null`
title(){
   cc=${#tt}
   [[ ${cc} -gt 20 ]] && echo ${tt::$cc-($cc-20)} || echo ${tt}
}

full_title_with_scrolling(){
  #tt=`playerctl metadata --format ' {{ title }} ' 2>/dev/null`
  l=${#tt} 
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

    zx=`playerctl metadata --format ' {{ title }} '`
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
    al=${#ar}
    [[ ${al} -gt 12 ]] && echo "⠀󰎈⠀"${ar}"⠀" || echo "⠀󰎈 ""${ar}"
}
img(){
    m=`playerctl metadata --format "{{mpris:artUrl}}"`
    if [[ -z "$m" ]]; then 
      echo "tmp0.png"
      else echo ${m:7}
    fi 
 
    if [[ $m -eq "No"  ]]; then
       echo `cp placeholderart.png tmp0.png`
    fi
   bgimg

}
bgimg(){
  zx=`playerctl metadata --format ' {{ title }} '`
  a="${zx// /}"
  a+="${ar// /}"
  #echo ${a}
  echo `python3 ~/.config/eww/ytsearch.py ${a} >> /dev/null ` 
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
elif [[ "$1" == "--bg-image" ]]; then
  bgimg
fi


