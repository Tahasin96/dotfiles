#!/usr/bin/env bash

# Nerd Font clock icon (requires a Nerd Font installed and set in Waybar)
clock_icon=" " # You can also try:   or 󰥔

# Date string
date_str=$(date +"%a, %B %d %I:%M%p")

# Print with Pango markup
printf "<span background='#668DE2' foreground='#1E1E1E' font_weight='normal'> %s </span><span background='#7AA1F6' foreground='#2F3A50'> %s </span>" "$clock_icon" "$date_str"
