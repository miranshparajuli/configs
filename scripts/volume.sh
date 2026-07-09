#!/bin/bash

# Get Volume (Multiplies by 100 to get a clean integer)
get_volume() {
    wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}'
}

# Check if muted
is_muted() {
    if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q "MUTED"; then
        echo "true"
    else
        echo "false"
    fi
}

notify_user() {
    vol=$(get_volume)
    mute=$(is_muted)
    
    # Clean the variable of any stray spaces or newlines just in case
    clean_vol=$(echo "$vol" | tr -d '\n' | tr -d ' ')
    clean_vol=${clean_vol:-0}
    
    if [[ "$mute" == "true" ]]; then
        notify-send -a "Volume" -u low -r 9993 "VOLUME: Muted"
    else
        notify-send -a "Volume" -u low -r 9993 -h int:value:"$clean_vol" "VOLUME: ${clean_vol}%"
    fi
}

case "$1" in
    --inc)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+
        notify_user
        ;;
    --dec)
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        notify_user
        ;;
    --toggle)
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        notify_user
        ;;
esac
