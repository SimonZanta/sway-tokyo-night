#!/bin/sh
case $(printf '󰌾  Lock\n󰍃  Logout\n󰜉  Reboot\n󰐥  Shutdown' | fuzzel -d --lines 4 --width 18 --prompt '󰐥  ') in
    *Lock) gtklock -d ;;
    *Logout) swaymsg exit ;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
