
title(){
	local tt
  local tt_len
	tt=`playerctl metadata --format ' {{ title }} '`
	[[ ${#tt_len} -gt 20 ]] && echo ${tt} || echo ${tt::$tt_len-($tt_len-20)}
	[[ ${tt} == "No players found" ]] && echo "No players found" | eww close ma
}
title_and_stuff(){
	local title,c,zy,zz,st
	title=`playerctl metadata --format ' {{ title }} '`
# 	status=`playerctl metadata --format '{{ status }}'`
	st=""
	c=${#title}
	if [[ ${zz} == "Paused" ]]; then
		st="玲⠀⠀⠀⠀怜"
	else st="玲⠀⠀⠀⠀怜"
	fi
	[[ ${#title} -gt 38 ]] && echo ${st} "\n" ${title::$c-($c-38)}"... " || echo ${st} "\n" ${title}" "
	
}
artist(){
	local ar
	ar=`playerctl metadata --format ' {{ artist }} '`
	echo "⠀ "${ar}" "
}
img(){
	local img_
	img_=`playerctl metadata --format "{{mpris:artUrl}}" `
	echo ${img_:7}
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
