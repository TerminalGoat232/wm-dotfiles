
#!/bin/bash
title(){
	local tt
	local tt_len
	tt=`playerctl metadata --format ' {{ title }} ' 2>/dev/null`
	tt_len=${#tt}
	[[ ${tt_len} -gt 20 ]] && echo ${tt::$tt_len-($tt_len-20)} || echo ${tt}
}
title_and_stuff(){
	local titl,titl_len,rtist,sttus,st,mm,i
	titl=`playerctl metadata --format ' {{ title }} '`
	#rtist=`playerctl metadata --format ' {{ artist }} '`
	sttus=`playerctl metadata --format '{{ status }}'`
	st=""
	titl_len=${#titl}
	[[ ${sttus} == "Paused" ]] && st="⠀玲⠀⠀  ⠀⠀怜" || st="⠀玲⠀⠀  ⠀⠀怜"
	[[ ${#titl} -gt 28 ]] && echo ${titl_len} "\n"${titl::$titl_len-($titl_len-28)}"...⠀⠀⠀" || { 
		for (( i=0;i<(32-${titl_len});++i )); do 
			mm+="⠀" 
		done 
		echo ${st} "\n"""${titl}${mm::$titl_len-($titl_len-18)}
	}
}
artist(){
	local ar
	local al
	local n
	local m
	ar=`playerctl metadata --format ' {{ artist }} '`
	al=${#ar}
	[[ ${al} -gt 12 ]] && echo "⠀⠀"${ar}"⠀" || echo "⠀"${ar}""
}
img(){
	local get_img_dir 
	get_img_dir=`playerctl metadata --format "{{mpris:artUrl}}"`
	echo ${get_img_dir:7}
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
fi
