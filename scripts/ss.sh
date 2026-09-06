#!/bin/bash

# 1. Setup directory and filename
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
FNAME="$DIR/$(date +'%Y%m%d_%H%M%S').png"

# 2. Capture area with slurp (monochrome colors)
# -b: overlay bg, -c: border color, -w: border width
if ! grim -g "$(slurp )" "$FNAME"; then
    exit 1
fi

# 3. Copy to clipboard
wl-copy < "$FNAME"

# 4. Send Dunst notification with the image as an icon
dunstify -i "$FNAME" -a "System" "Screenshot Captured" "Saved to ~/Pictures/Screenshots" -h string:x-dunst-stack-tag:screenshot

