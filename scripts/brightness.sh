#!/bin/bash

get_brightness() {
    brightnessctl -m | cut -d, -f4 | sed 's/%//'
}

notify_user() {
    BRIGHTNESS=$(get_brightness)
    

    notify-send -a "Brightness" -u low -r 9992 -h int:value:"$BRIGHTNESS" "BRIGHTNESS: ${BRIGHTNESS}%"
}

case "$1" in
    --inc)
        brightnessctl set +5%
        notify_user
        ;;
    --dec)
        brightnessctl set 5%-
        notify_user
        ;;
esac
