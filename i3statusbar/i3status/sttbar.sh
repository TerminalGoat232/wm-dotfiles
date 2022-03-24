
bg_bar_color="#1f1e1c"


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



myip_public() {
  local bg="#1976D2"
  separator $bg "#FFD180"
  echo -n ",{"
  echo -n "\"name\":\"ip_public\","
  echo -n "\"full_text\":\" $(/home/usrname/.config/i3status/ip.py) \","
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
  echo -n "\"full_text\":\"  $(/home/usrname/.config/i3/i3status/i3status/disk.py)% \","
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
  echo -n "\"full_text\":\" ◮ $(/home/usrname/.config/i3/i3status/i3status/memory.py)% \","
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
  echo -n "\"full_text\":\" ▼ CPU usage: $(/home/usrname/.config/i3/i3status/i3status/cpu.py)%  \","
  echo -n "\"background\":\"#ffb5a1\","
  echo -n "\"color\":\"#1f1e1c\","
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
  echo -n "\"full_text\":\" ${cau} $(/home/usrname/.config/i3/i3status/i3status/temp.py) \","
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
  echo -n "\"full_text\":\" ${cau} $(/home/usrname/.config/i3/i3status/i3status/temp1.py) \","
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

echo '{ "version": 1, "click_events":true }'     
echo '['                 
echo '[]'


(while :;
do
  echo -n ",["
  core0
  core1
  myip_local
  disk_usage
  memory
  cpu_usage
  mydate
  battery0
  volume
  logout
  echo "]"
  sleep 0.1
done) &

# click events [idkoisadsfndoirgntdpgrg]
while read line;
do
  if [[ $line == *"name"*"id_cpu_usage"* ]]; then
   i3-sensible-terminal -e htop &

  # TIME
  elif [[ $line == *"name"*"id_time"* ]]; then
    i3-sensible-terminal -e /home/usrname/.config/i3status/click_time.sh &

  # VOLUME
  elif [[ $line == *"name"*"id_volume"* ]]; then
    i3-sensible-terminal -e alsamixer &

  # LOGOUT
  elif [[ $line == *"name"*"id_logout"* ]]; then
    i3-nagbar -t warning -m 'Log out ?' -b 'yes' 'i3-msg exit' > /dev/null &

  fi  
done
