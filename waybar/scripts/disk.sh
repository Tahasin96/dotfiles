#!/usr/bin/env bash

# Nerd Font disk icon
disk_icon="󰋊" # Alternative: 

# Get used percentage
used=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')

# Output with Pango markup and symmetric padding
printf "<span background='#1E222A' foreground='#E06C75' font_weight='bold'> %s %s%% </span>" "$disk_icon" "$used"
