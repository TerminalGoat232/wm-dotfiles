
bg_bar_color="#1f1e1c"

# Print a left caret separator
# @params {string} $1 text color, ex: "#FF0000"
# @params {string} $2 background color, ex: "#FF0000"
separator() {
  echo -n "{"
  echo -n "\"full_text\":\"Σ\"," # CTRL+Ue0b2
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border\":\"$bg_bar_color\","
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_top\":0,"
  echo -n "\"border_bottom\":0,"
  echo -n "\"color\":\"$1\","
  echo -n "\"background\":\"#1f1e1c\""
  echo -n "}"
}

common() {

  echo -n "\"border\": \"$bg_bar_color\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":15,"
  echo -n "\"border_top\":0,"
  echo -n "\"border_bottom\":2,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_radius\":10"
}

# mycrypto() {
#   local bg="#FFD180"
#   separator $bg $bg_bar_color
#   echo -n ",{"
#   echo -n "\"name\":\"id_crypto\","
#   echo -n "\"full_text\":\" $(/home/terminalgoat/.config/i3status/crypto.py) \","
#   echo -n "\"color\":\"#000000\","
#   echo -n "\"background\":\"$bg\","
#   common
#   echo -n "},"
# }

myip_public() {
  local bg="#1976D2"
  separator $bg "#FFD180"
  echo -n ",{"
  echo -n "\"name\":\"ip_public\","
  echo -n "\"full_text\":\" $(/home/terminalgoat/.config/i3status/ip.py) \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myvpn_on() {
  local bg="#424242" # grey darken-3
  local icon=""
  if [ -d /proc/sys/net/ipv4/conf/proton0 ]; then
    bg="#E53935" # rouge
    icon=""
  fi
  separator $bg "#1976D2" # background left previous block
  bg_separator_previous=$bg
  echo -n ",{"
  echo -n "\"name\":\"id_vpn\","      
  echo -n "\"full_text\":\" ${icon} VPN \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

myip_local() {
  local bg="#ffad1c" # vert
  separator $bg $bg_separator_previous
  echo -n ",{"
  echo -n "\"name\":\"ip_local\","
  echo -n "\"full_text\":\"  $(ip route get 1 | sed -n 's/.*src \([0-9.]\+\).*/\1/p') \","
  echo -n "\"background\":\"$bg\","
  echo -n "\"color\":\"#1f1e1c\","

  common
  echo -n "},"
}

disk_usage() {
  local bg="#fc9c04"
  separator $bg "#2E7D0f"
  echo -n ",{"
  echo -n "\"name\":\"id_disk_usage\","
  echo -n "\"full_text\":\"  $(/home/terminalgoat/.config/i3/i3status/i3status/disk.py)% \","
  echo -n "\"background\":\"$bg\","
  echo -n "\"color\":\"#1f1e1c\","
  common
  echo -n "}"
  echo -n ",{"
  echo -n "\"full_text\":\"Σ\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_top\":0,"
  echo -n "\"color\":\"#ffb5a1\","
  echo -n "\"border_bottom\":0"
  echo -n "}"

}

memory() {
  # local bg="#ffb5a1"
  # separator $bg bg_separator_previous
  # echo -n ",{"
  # echo -n "\"name\":\"me\","
  # echo -n "\"full_text\":\"Σ\","
  # echo -n "\"color\":\"#ffb5a1\""
  # echo -n "}"
  echo -n ",{"
  echo -n "\"name\":\"id_memory\","
  echo -n "\"full_text\":\" ◮ $(/home/terminalgoat/.config/i3/i3status/i3status/memory.py)% \","
  echo -n "\"background\":\"#ffb5a1\","
  echo -n "\"color\":\"#1f1e1c\","

  common
  echo -n "}"
  echo -n ",{"
  echo -n "\"full_text\":\"Σ\","
  echo -n "\"separator\":false,"
  echo -n "\"separator_block_width\":0,"
  echo -n "\"border_left\":0,"
  echo -n "\"border_right\":0,"
  echo -n "\"border_top\":0,"
  echo -n "\"color\":\"#ffb5a1\","
  echo -n "\"border_bottom\":0"
  echo -n "}"
}

cpu_usage() {
 
  echo -n ",{"
  echo -n "\"name\":\"id_cpu_usage\","
  echo -n "\"full_text\":\" ▼ CPU usage: $(/home/terminalgoat/.config/i3/i3status/i3status/cpu.py)%  \","
  echo -n "\"background\":\"#ffb5a1\","
  echo -n "\"color\":\"#1f1e1c\","
  common
  echo -n "},"
}

meteo() {
  local bg="#546E7A"
  separator $bg "#3949AB"
  echo -n ",{"
  echo -n "\"name\":\"id_meteo\","
  echo -n "\"full_text\":\" $(/home/terminalgoat/.config/i3/i3status/i3status/meteo.py) \","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

mydate() {
  local bg="#f9c9a7"
  separator $bg "#546E7A"
  echo -n ",{"
  echo -n "\"name\":\"id_time\","
  echo -n "\"full_text\":\"  $(date "+%a %d/%m %H:%M:%S") \","
  echo -n "\"color\":\"#1f1e1c\","
  echo -n "\"background\":\"$bg\","
  common
  echo -n "},"
}

battery0() {
  if [ -f /sys/class/power_supply/BAT0/uevent ]; then
    local bg="#D69E2E"
    separator $bg "#E0E0E0"
    bg_separator_previous=$bg
    prct=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_CAPACITY=" | cut -d'=' -f2)
    charging=$(cat /sys/class/power_supply/BAT0/uevent | grep "POWER_SUPPLY_STATUS" | cut -d'=' -f2) 
    icon=""
    if [ "$charging" == "Charging" ]; then
      icon=""
    fi
    echo -n ",{"
    echo -n "\"name\":\"battery0\","
    echo -n "\"full_text\":\" ${icon} ${prct} % \","
    echo -n "\"color\":\"#1f1e1c\","
    echo -n "\"background\":\"$bg\","
    common
    echo -n "},"
  else
    bg_separator_previous="#E0E0E0"
  fi
}
core0(){
  local bg="#FE8D8A" 
  # local cl = "#1f1e1c"
  separator $bg $bg_separator_previous
  echo -n ",{"
  echo -n "\"name\":\"core0\","
  echo -n "\"full_text\":\" ${cau} $(/home/terminalgoat/.config/i3/i3status/i3status/temp.py) \","
  echo -n "\"background\":\"$bg\","
  echo -n "\"color\":\"#1f1e1c\","
  common
  echo -n "},"
}
core1(){
  local bg="#FEA48A" 
  # local cl = "#1f1e1c"
  separator $bg $bg_separator_previous
  echo -n ",{"
  echo -n "\"name\":\"core0\","
  echo -n "\"full_text\":\" ${cau} $(/home/terminalgoat/.config/i3/i3status/i3status/temp1.py) \","
  echo -n "\"background\":\"$bg\","
  echo -n "\"color\":\"#1f1e1c\","
  common
  echo -n "},"
}
volume() {
  local bg="#baa7e7"
  separator $bg $bg_separator_previous  
  vol=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
  echo -n ",{"
  echo -n "\"name\":\"id_volume\","
  if [ $vol -le 0 ]; then
    echo -n "\"full_text\":\"  ${vol}% \","
  else
    echo -n "\"full_text\":\"  ${vol}% \","
  fi
  echo -n "\"background\":\"$bg\","
  echo -n  "\"color\":\"#1f1e1c\","
  common
  echo -n "},"
  separator $bg_bar_color $bg
}

systemupdate() {
  local nb=$(checkupdates | wc -l)
  if (( $nb > 0)); then
    echo -n ",{"
    echo -n "\"name\":\"id_systemupdate\","
    echo -n "\"full_text\":\"  ${nb}\""
    echo -n "}"
  fi
}

logout() {
  echo -n ",{"
  echo -n "\"name\":\"id_logout\","
  echo -n "\"full_text\":\"  \""
  echo -n "}"
}

# https://github.com/i3/i3/blob/next/contrib/trivial-bar-script.sh
echo '{ "version": 1, "click_events":true }'     # Send the header so that i3bar knows we want to use JSON:
echo '['                    # Begin the endless array.
echo '[]'                   # We send an empty first array of blocks to make the loop simpler:


(while :;
do
  echo -n ",["
  core0
  core1
  #mycrypto
  # myip_public
  # #myvpn_on
  myip_local
  disk_usage
  memory
  cpu_usage
  # meteo
  mydate
  battery0
  volume
  #systemupdate
  logout
  echo "]"
  sleep 0.1
done) &

# click events
while read line;
do
  # echo $line > /home/terminalgoat/gitclones/github/i3/tmp.txt
  # {"name":"id_vpn","button":1,"modifiers":["Mod2"],"x":2982,"y":9,"relative_x":67,"relative_y":9,"width":95,"height":22}

  # if [[ $line == *"name"*"id_vpn"* ]]; then
  #  i3-sensible-terminal -e /home/terminalgoat/.config/i3status/click_vpn.sh &

  # elif [[ $line == *"name"*"id_systemupdate"* ]]; then
  #  i3-sensible-terminal -e /home/terminalgoat/.config/i3status/click_checkupdates.sh &

  # # CPU
  if [[ $line == *"name"*"id_cpu_usage"* ]]; then
   i3-sensible-terminal -e htop &

  # TIME
  elif [[ $line == *"name"*"id_time"* ]]; then
    i3-sensible-terminal -e /home/terminalgoat/.config/i3status/click_time.sh &

  # METEO
  elif [[ $line == *"name"*"id_meteo"* ]]; then
    xdg-open https://openweathermap.org/city/2986140 > /dev/null &

  # CRYPTO
  elif [[ $line == *"name"*"id_crypto"* ]]; then
    xdg-open https://www.livecoinwatch.com/ > /dev/null &

  # VOLUME
  elif [[ $line == *"name"*"id_volume"* ]]; then
    i3-sensible-terminal -e alsamixer &

  # LOGOUT
  elif [[ $line == *"name"*"id_logout"* ]]; then
    i3-nagbar -t warning -m 'Log out ?' -b 'yes' 'i3-msg exit' > /dev/null &

  fi  
done
