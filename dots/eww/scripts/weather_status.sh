#!/bin/bash
region=''
data_source=`curl -Z "https://wttr.in/{$region}?format=%t+%f+%c+%h+%w+%P+%u+%m+%p" 2>/dev/null`
time=$(date +%-H)
dat_list=($data_source)
 
#some notation
# --- $1  $2   $3      $4     $5    $6    $7  $8   $9  ---
#     rel feel weather humid  wind  atm   uv  moon precip
real_temp(){
  #echo $(echo $data_source | awk '{print $1}')
  echo ${dat_list[0]}
}
feel_temp(){
  #echo $(echo $data_source | awk '{print $2}')
  echo ${dat_list[1]}
}
weather_cond(){
  wther_icons="⛅☁🌦⛈🌨🌩🌫🌧☀"
  wther_icons_replacement="󰅟󰙾󰼶󰖓"
  k=${dat_list[2]}
  i=0
  while [ $i -lt ${#wther_icons} ]; do
    if [[ "$k" == *${wther_icons:${i}:1}* ]]; then  
      printf ${wther_icons_replacement:${i}:1}
    fi
    i=$((i+1))
  done 
}
humid(){
  echo "%󰖌" ${dat_list[3]}
}
wind_speed(){
  echo "" ${dat_list[4]}
}
air_pressure(){
  echo "   " ${dat_list[5]}
}
uv(){
  echo "uv" ${dat_list[6]}
}
moon_phase(){
  echo ${dat_list[7]}
}
precipitation(){
  echo "  " ${dat_list[8]}
}
delta_t(){
  echo "󰇂C" $(echo $data_source | awk '{print $2-$1}')
}
time_session(){
  res='' 
  if [[ $time -ge "4" && $time -le "7" ]]; then res="󰖜⠀"
  elif [[ $time -ge "7" && $time -le "9" ]]; then res="⠀"
  elif [[ $time -ge "09" && $time -le "15" ]]; then res=" 󰖙⠀"
  elif [[ $time -ge "15" && $time -le "19" ]]; then res="󰖛⠀"
  elif [[ $time -ge "19" && $time -le "24" ]]; then res="⠀"
  elif [[ $time -eq "24" || $time -le "4"  ]]; then res="󰖔⠀"
  fi
  printf $res
}
#echo $data_source
case $1 in
  "-t") real_temp ;;
  "-T") feel_temp ;;
  "-w") weather_cond ;;
  "-h") humid ;;
  "-W") wind_speed ;;
  "-a") air_pressure ;;
  "-u") uv ;;
  "-m") moon_phase ;;
  "-p") precipitation ;;
  "-d") delta_t ;;
  "-s") time_session ;;
  "-b") a= time_session ; b= weather_cond 
        echo $a $b ;;
esac

