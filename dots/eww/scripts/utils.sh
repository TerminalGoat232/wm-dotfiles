#!bin/bash
swp_used=`free -m | grep "Swap" | awk '{print $3}'`
swp=`free -m | grep "Swap" | awk '{print int(($2*0.001))}'`
core_temp(){
  echo $(sensors | grep "CPU" | awk '{print substr($2,2)}')
}
swap_used_perc(){
  res=$(bc <<<"scale=3; $swp_used * 0.00625")
  printf "%.0f\n" $res
}

swap_total(){
 echo  $swp 
}
if [[ "$1" == "-c" ]]; then 
  core_temp
elif [[ "$1" == "-S" ]]; then 
  swap_total
elif [[ "$1" == "-sp" ]]; then 
  swap_used_perc
fi
