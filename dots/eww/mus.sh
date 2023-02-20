
title(){
	local tt
	local tt_len
	tt=`playerctl metadata --format ' {{ title }} '`
	tt_len=${#tt}
	[[ ${tt_len} -gt 20 ]] && echo ${tt::$tt_len-($tt_len-20)} || echo ${tt}
	[[ ${tt} == "No players found" ]] && echo "No players found" | eww close ma
}
title_and_stuff(){
	local ttl,c,status,mm,i
	ttl=`playerctl metadata --format ' {{ title }} '`
# 	zy=`playerctl metadata --format ' {{ artist }} '`
# 	zz=`playerctl metadata --format '{{ status }}'`
	status=""
	c=${#ttl}
	if [[ ${zz} == "Paused" ]]; then
		status="⠀⠀⠀⠀玲⠀⠀  ⠀⠀怜"
	else status="⠀⠀⠀⠀玲⠀⠀  ⠀⠀怜"
	fi
	[[ ${#ttl} -gt 28 ]] && echo ${status} "\n" ${ttl::$c-($c-28)}"...⠀⠀⠀" || { 
		for (( i=0;i<(28-${c});++i )); do 
			mm+="⠀" 
		done 
		echo ${status} "\n" ${ttl}${mm}
	}
	
}
artist(){
	local ar
	local al
	local n
	local m
	ar=`playerctl metadata --format ' {{ artist }} '`
	al=${#ar}
	[[ ${al} -gt 12 ]] && echo "⠀ "${ar}"⠀" || echo "⠀"${ar}""
}
img(){
	local m 
	m=`playerctl metadata --format "{{mpris:artUrl}}" `
	echo ${m:7}
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
