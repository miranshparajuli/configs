#!/bin/bash

# Toggle logic for Gammastep
if pgrep -x "gammastep" > /dev/null; then
    pkill -x gammastep
    dunstify -a "Display" -u low -h string:x-dunst-stack-tag:nightlight \
        "Night Light Disabled" "Nightlight is deactivated"
else
    gammastep -O 4200 & 
    dunstify -a "Display" -u low -h string:x-dunst-stack-tag:nightlight \
        "Night Light Enabled" "NightLight is active"
fi
