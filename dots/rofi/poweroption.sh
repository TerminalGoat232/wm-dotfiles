!#/bin/bash
option(){
  if [ -z $1 ]; then 
    echo "$2"
    else $3
  fi
}
case $1 in 
  "-s")
    option "$2" "goodnight :3" "systemctl poweroff" ;;
  "-r")
    option "$2" "here we go again ;>" "reboot" ;;
  "-t") 
    option "$2" "a mirmir =-=" "systemctl hibernate" ;;
esac 

