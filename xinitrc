#!/bin/sh

cd ~/

export LANG=en_US.UTF-8  
export LC_ALL=en_US.UTF-8

setxkbmap -option caps:swapescape
xsetroot -cursor_name left_ptr

while true; do
    BAT="BATT"

    if [ -d "/sys/class/power_supply/$BAT" ]; then
        CAP=$(cat /sys/class/power_supply/$BAT/capacity)
        STAT=$(cat /sys/class/power_supply/$BAT/status)

        if [ "$STAT" = "Charging" ]; then
            BI="CHR"
        else
            BI="BAT"
        fi
        BAT_STR="[$BI $CAP%] "
    else
        BAT_STR=""
    fi

    xsetroot -name " $BAT_STR [$(date '+%Y-%m-%d %H:%M')] "
    
    sleep 30
done &

feh --bg-fill ~/.config/fall.png
picom --backend glx --vsync &
exec /usr/local/bin/dwm
