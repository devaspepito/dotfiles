#!/usr/bin/env bash

config="$HOME/.config/rofi/powermenu.rasi"

actions=$(echo -e "  Lock\n  PowerOff\n  Reboot\n$(printf '\u200A')  Suspend\n  Hibernate\n  Logout")

# Display logout menu
selected_option=$(echo -e "$actions" | rofi -dmenu -i -config "${config}" || pkill -x rofi)

# Perform actions based on the selected option
case "$selected_option" in
*Lock)
  betterlockscreen -l dim
  ;;
*PowerOff)
  systemctl poweroff
  ;;
*Reboot)
  systemctl reboot
  ;;
*Suspend)
  systemctl suspend
  ;;
*Hibernate)
  systemctl hibernate
  ;;
*Logout)
  i3-msg exit
  ;;
esac
