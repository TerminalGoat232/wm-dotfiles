#!/bin/bash
check_workspace(){
    local a 
    local b
    a=`wmctrl -d | grep -w "*"`
    b=${a:31}
    [[ ${b} -eq "1" ]] && `eww open clendar` || `eww close clendar`
}
while true
    do 
        check_workspace
        sleep 1;
    done
