#!/bin/bash 
script_id=`pgrep -f "mus_func.sh"`
#is_looping=`cat looping_status.txt`
loop(){
  while [ -f scripts/tmp/tmpf ] ; do
    current_pos=`playerctl metadata -f '{{ position }}'`
    duration=`playerctl metadata -f '{{ mpris:length  }}'`
    delta=$(( duration - current_pos ))
    echo "dur " $duration "cur" $current_pos
    echo $delta
    if [[ $delta -lt 1000000 ]]; then
      `playerctl position 0`
    fi
    sleep 0.1
  done 
}
exit_loop(){
  echo "kurwa"
  #playerctl position 10
  #kill -INT 3766276
  #while :; do
  # current_pos=`playerctl metadata -f '{{ position }}'`
  #  playerctl position $current_pos
  #done
}
test(){
  echo $is_looping
}
l1(){
   if [ -f scripts/tmp/tmpf ]; then
     rm -f scripts/tmp/tmpf
     exit_loop
   fi
   }
l2(){
  #if [ ! -f scripts/tmp/tmpf ]; then
     touch scripts/tmp/tmpf 
     loop
  #fi
}
case $1 in
  "-t") test;;
  "-l") l2;;
  "-xl") l1;;
esac
