#!/usr/bin/env bash

print_title() {
  win_info=$(hyprctl activewindow -j 2>/dev/null)

  # If no active window, show nothing
  if [ -z "$win_info" ] || [ "$win_info" = "null" ]; then
    echo '{"text": "", "class": "windowtitle"}'
    return
  fi

  win_class=$(echo "$win_info" | jq -r '.class // ""')
  win_title=$(echo "$win_info" | jq -r '.title // ""')

  case "$win_class" in
  "Brave-browser")
    icon=""
    color="#FF4B2B"
    win_title="Brave"
    ;;
  "firefox")
    icon=""
    color="#E66000"
    win_title="Mozilla Firefox"
    ;;
  "kitty")
    icon=""
    color="#50FA7B"
    ;;
  "code")
    icon=""
    color="#8BE9FD"
    ;;
  "discord")
    icon=""
    color="#5865F2"
    win_title="Discord"
    ;;
  "dolphin")
    icon=""
    color="#1E90FF"
    win_title="Dolphin"
    ;;
  "steam")
    icon=""
    color="#1B2838"
    win_title="Steam"
    ;;
  *)
    icon=""
    color="#FFFFFF"
    ;;
  esac

  # Final JSON output with Pango markup
  printf '{"text": "<span foreground=\\"%s\\">%s</span> %s", "class": "windowtitle", "markup": "pango"}\n' "$color" "$icon" "$win_title"
}

# Print something instantly on startup
print_title

# Listen for Hyprland events and update instantly
socat -U UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
  while read -r event; do
    case "$event" in
    activewindow* | openwindow* | closewindow*) print_title ;;
    esac
  done
