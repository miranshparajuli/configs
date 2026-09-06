#!/usr/bin/env bash

if pgrep -x waybar > /dev/null; then
    pkill waybar;
    
    waybar & disown
else
    waybar & disown
fi

if pgrep -x dunst > /dev/null; then
    pkill dunst;
    
    dunst & disown
else
    dunst & disown
fi

