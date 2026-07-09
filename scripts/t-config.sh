#!/bin/bash

CONFIG_DIR="$HOME/.config"
TERM_EMU="foot"

MENU_ITEMS="sway
fish
scripts
waybar
rofi
foot
dunst
nvim
btop
yazi
fastfetch
startpage
starship.toml"

SELECTION=$(echo "$MENU_ITEMS" | rofi -dmenu -i -p "Config:")

if [ -z "$SELECTION" ]; then
    exit 0
fi

case "$SELECTION" in
    "sway")
        FINAL_TARGET="$CONFIG_DIR/sway/config"
        ;;
    "fish")
        FINAL_TARGET="$CONFIG_DIR/fish/config.fish"
        ;;
    "rofi")
        FINAL_TARGET="$CONFIG_DIR/rofi/config.rasi"
        ;;
    "btop")
        FINAL_TARGET="$CONFIG_DIR/btop/btop.conf"
        ;;
    "dunst")
        FINAL_TARGET="$CONFIG_DIR/dunst/dunstrc"
        ;;
    "nvim")
        FINAL_TARGET="$CONFIG_DIR/nvim/"
        ;;
    "startpage")
        FINAL_TARGET="$CONFIG_DIR/startpage/startpage.html"
        ;;
    "fastfetch")
        FINAL_TARGET="$CONFIG_DIR/fastfetch/config.jsonc"
        ;;
    "foot")
        FINAL_TARGET="$CONFIG_DIR/foot/foot.ini"
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
brightness.sh
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
