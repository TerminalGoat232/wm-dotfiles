

slc(){
  local tmp
  tmp=${1%"${1##*[!/]}"}
  tmp=${tmp##*/}
  tmp=${tmp%"${2/"$tmp"}"}
  printf '%s\n' "${tmp:-/}"
}
title(){
	local tt
	local cc
	local ma
	ma="..."
	tt=`playerctl metadata --format ' {{ title }} '`
	cc=${#tt}
	[[ ${#cc} -gt 20 ]] && echo ${tt} || echo ${tt::$cc-($cc-20)}
	[[ ${tt} == "No players found" ]] && echo "No players found" | eww close ma
}
title_and_stuff(){
	local zx,c,zy,zz, st
	zx=`playerctl metadata --format ' {{ title }} '`
	zy=`playerctl metadata --format ' {{ artist }} '`
	zz=`playerctl metadata --format '{{ status }}'`
	st=""
	c=${#zx}
	if [[ ${zz} == "Paused" ]]; then
		st="玲⠀⠀⠀⠀怜"
	else st="玲⠀⠀⠀⠀怜"
	fi
	[[ ${#zx} -gt 38 ]] && echo ${st} "\n" ${zx::$c-($c-38)}"... " || echo ${st} "\n" ${zx}" "
	
}
artist(){
	local ar
	ar=`playerctl metadata --format ' {{ artist }} '`
	echo "⠀ "${ar}" "
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
