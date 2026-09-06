#!/bin/bash

CONFIG_DIR="$HOME/.config"
TERM_EMU="/usr/local/bin/st"

MENU_ITEMS="suckless
fish
scripts
rofi
dunst
nvim
yazi
fastfetch
startpage
starship"

SELECTION=$(echo "$MENU_ITEMS" | rofi -dmenu -i -p "Config:")

if [ -z "$SELECTION" ]; then
    exit 0
fi

case "$SELECTION" in
    "suckless")
        SUCKLESS_ITEMS="dwm
st
slstatus
slock"
    FILE_SELECTION=$(echo "$SUCKLESS_ITEMS" | rofi -dmenu -i -p "Suckless:")
    if [ -z "$FILE_SELECTION"]; then
        exit 0
    fi
    FINAL_TARGET="$CONFIG_DIR/suckless/$FILE_SELECTION/config.h"
        ;;
    "fish")
        FINAL_TARGET="$CONFIG_DIR/fish/config.fish"
        ;;
    "rofi")
        FINAL_TARGET="$CONFIG_DIR/rofi/config.rasi"
        ;;
    "dunst")
        FINAL_TARGET="$CONFIG_DIR/dunst/dunstrc"
        ;;
    "nvim")
        FINAL_TARGET="$CONFIG_DIR/nvim/lua/"
        ;;
    "startpage")
        FINAL_TARGET="$CONFIG_DIR/startpage/startpage.html"
        ;;
    "fastfetch")
        FINAL_TARGET="$CONFIG_DIR/fastfetch/config.jsonc"
        ;;
    "yazi")
        YAZI_ITEMS="yazi.toml
keymap.toml
theme.toml"
        FILE_SELECTION=$(echo "$YAZI_ITEMS" | rofi -dmenu -i -p "Yazi:")
        if [ -z "$FILE_SELECTION" ]; then
            exit 0 
        fi
        FINAL_TARGET="$CONFIG_DIR/yazi/$FILE_SELECTION"
        ;;
    "starship.toml")
        FINAL_TARGET="$CONFIG_DIR/starship.toml"
        ;;
    "waybar")
        WAYBAR_ITEMS="config.jsonc
style.css"
        
        FILE_SELECTION=$(echo "$WAYBAR_ITEMS" | rofi -dmenu -i -p "Waybar:")
            
        if [ -z "$FILE_SELECTION" ]; then
            exit 0
        fi
        
        FINAL_TARGET="$CONFIG_DIR/waybar/$FILE_SELECTION"
        ;;
    "scripts")
        SCRIPT_ITEMS="volume.sh
bar.sh
config.sh
nightlight.sh
ss.sh"
        
        FILE_SELECTION=$(echo "$SCRIPT_ITEMS" | rofi -dmenu -i -p "Scripts:")
        
        if [ -z "$FILE_SELECTION" ]; then
            exit 0
        fi
        
        FINAL_TARGET="$CONFIG_DIR/scripts/$FILE_SELECTION"
        ;;
    *)
        exit 1
        ;;
esac

$TERM_EMU -e nvim "$FINAL_TARGET"
