#!/usr/bin/env bash
TEMP_FILE="/tmp/waybar_cpu_prev"

# Read current CPU stats
current=$(grep 'cpu ' /proc/stat)
current_values=($current)

if [[ -f "$TEMP_FILE" ]]; then
  # Read previous stats
  previous=$(cat "$TEMP_FILE")
  previous_values=($previous)

  # Calculate differences (user + nice + system vs idle)
  user_diff=$((${current_values[1]} - ${previous_values[1]}))
  nice_diff=$((${current_values[2]} - ${previous_values[2]}))
  system_diff=$((${current_values[3]} - ${previous_values[3]}))
  idle_diff=$((${current_values[4]} - ${previous_values[4]}))

  total_diff=$((user_diff + nice_diff + system_diff + idle_diff))
  active_diff=$((user_diff + nice_diff + system_diff))

  if [[ $total_diff -gt 0 ]]; then
    usage=$(awk "BEGIN {printf \"%.2f\", $active_diff * 100 / $total_diff}")
  else
    usage="0.00"
  fi
else
  # First run - show 0
  usage="0.00"
fi

# Save current stats for next run
echo "$current" >"$TEMP_FILE"

# Output Pango markup
printf "<span background='#EACA8A' foreground='#282C34' font_weight='normal'> CPU </span><span background='#282C34' foreground='#D7DAE0'> %s </span>" "$usage"
