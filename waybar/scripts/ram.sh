#!/usr/bin/env bash

# Nerd Font RAM icon
ram_icon=" " # Try also: 󰍛

# Get used RAM in GB as an integer
used=$(free --giga | awk '/^Mem:/ {print $3}')

# Output with Pango markup, custom sizes
printf "<span background='#1E222A' foreground='#C397D8' font_weight='bold' size='10752'> %s</span><span background='#1E222A' foreground='#B88FCC' size='12000'> %sG </span>" "$ram_icon" "$used"
