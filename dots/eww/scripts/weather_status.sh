#!/bin/bash
region="thua-thien-thuy-xuan"
data_source=`curl "https://wttr.in/{$region}?format=%t+%f+%c+%h+%w+%P+%u+%m+%p" 2>/dev/null`
time=$(date +%T)
#some notation
# --- $1  $2   $3      $4     $5    $6    $7  $8   $9  ---
#     rel feel weather humid  wind  atm   uv  moon precip
real_temp(){
  echo $(echo $data_source | awk '{print $1}')
}
feel_temp(){
  echo $(echo $data_source | awk '{print $2}')
}
weather_cond(){
  wther_icons="⛅☁🌦⛈🌨🌩🌫🌧☀"
  wther_icons_replacement="󰅟󰙾󰼶󰖓"
  k=$(echo $data_source | awk '{print $3}')
  i=0
  while [ $i -lt ${#wther_icons} ]; do
    if [[ "$k" == *${wther_icons:${i}:1}* ]]; then  
      echo ${wther_icons_replacement:${i}:1}
    fi
    i=$((i+1))
  done 
}
humid(){
  echo $(echo $data_source | awk '{print $4}')
}
wind_speed(){
  echo $(echo $data_source | awk '{print $5}')
}
air_pressure(){
  echo $(echo $data_source | awk '{print $6}')
}
uv(){
  echo $(echo $data_source | awk '{print $7}')
}
moon_phase(){
  echo $(echo $data_source | awk '{print $8}')
}
precipitation(){
  echo $(echo $data_source | awk '{print $9}')
}
delta_t(){
  echo $(echo $data_source | awk '{print $2-$1}')
}
#holy hell
time_session(){
  trd_time=${time:0:2}
  if [[ $trd_time -ge "4" && $trd_time -le "7" ]]; then echo "󰖜"
  elif [[ $trd_time -ge "7" && $trd_time -le "9" ]]; then echo ""
  elif [[ $trd_time -ge "9" && $trd_time -le "15" ]]; then echo "󰖙"
  elif [[ $trd_time -ge "15" && $trd_time -le "19" ]]; then echo "󰖛"
  elif [[ $trd_time -ge "19" && $trd_time -le "24" ]]; then echo ""
  elif [[ $trd_time -eq "24" || $trd_time -le "4"  ]]; then echo "󰖔"
  fi
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
esac


