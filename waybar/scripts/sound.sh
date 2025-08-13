#!/usr/bin/env bash

vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)
if [ "$mute" = "true" ]; then
  vol="MUTE"
else
  vol="${vol}%"
fi

printf "<span background='#E5C07B' foreground='#1E1E1E' font_weight='bold'> VOL </span><span background='#1E1E1E' foreground='#D7DAE0'> %s </span>" "$vol"
