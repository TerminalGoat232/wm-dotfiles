#!/bin/bash
region=''
data_source=`curl -Z "https://wttr.in/{$region}?format=%t+%f+%c+%h+%w+%P+%u+%m+%p" 2>/dev/null`
time=$(date +%-H)
dat_list=($data_source)
 
# Some notation for each value in dat_list[i]
#  i   |     1         2       3       4   |
# data | real_temp feel_temp weather humid |
#  __  |     5       6      7     8    9     |
#  __  |   wind   pressure  uv  moon precip  |

check4Digits(){ # <$1: STR> -> BOOL
  [[ "$1" =~ [0-9] ]] && 
    echo "true" || echo "false"
}

echoExpect(){ # <$1:STR $2:ERR_STR> -> STR
  has_digits=$(check4Digits "$1")
  if [[ "$has_digits" == "true" && ${#1} -ge 1 ]]; then
    echo "$1"
  else 
    echo "$2"
  fi
}

real_temp(){
  echoExpect ${dat_list[0]} "OwO?"
}

feel_temp(){
  echoExpect ${dat_list[1]} "UwU?"
}

weather_cond(){
  wther_icons="⛅☁🌦⛈🌨🌩🌫🌧☀"
  wther_icons_replacement="󰅟󰙾󰼶󰖓"
  k=${dat_list[2]}
  if [[ ${#k} -lt 1 ]]; then 
    echo " "
  else 
    i=0
    while [ $i -lt ${#wther_icons} ]; do
      if [[ "$k" == *${wther_icons:${i}:1}* ]]; then  
        echo ${wther_icons_replacement:${i}:1}
      fi
      i=$((i+1))
    done 
  fi
}
humid(){
  echoExpect "%󰖌 "${dat_list[3]} "n/a"
}
wind_speed(){
  echoExpect " "${dat_list[4]} "n/a"
}
air_pressure(){
  echoExpect "    "${dat_list[5]} "n/a"
}
uv(){
  echoExpect "uv "${dat_list[6]} "n/a"
}
moon_phase(){
  echoExpect ${dat_list[7]} "n/a"
}
precipitation(){
  echoExpect "   "${dat_list[8]} "n/a"
}
delta_t(){
  echo "󰇂C "$(echo $data_source | awk '{print $2-$1}')
}
time_session(){
  res='' 
  if [[ $time -ge "4" && $time -le "7" ]]; then res="󰖜⠀"
  elif [[ $time -ge "7" && $time -le "9" ]]; then res="⠀"
  elif [[ $time -ge "9" && $time -le "15" ]]; then res=" 󰖙⠀"
  elif [[ $time -ge "15" && $time -le "19" ]]; then res="󰖛⠀"
  elif [[ $time -ge "19" && $time -le "24" ]]; then res="⠀"
  elif [[ $time -eq "24" || $time -le "4"  ]]; then res="󰖔⠀"
  fi
  printf $res
}

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

