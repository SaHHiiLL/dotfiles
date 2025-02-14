#!/bin/env bash

if [ $1 == "poweroff" ]; then
    systemctl poweroff
elif [ $1 == "reboot" ]; then
    systemctl reboot
elif [ $1 == "logout" ]; then
    loginctl kill-user $USER
elif [ $1 == "suspend" ]; then
    mpc -q pause
    amixer set Master mute
    systemctl suspend
elif [ $1 == "test" ]; then
    notify-send "Powermenu test"
elif [ $1 == "lock" ]; then
    notify-send "Lock not implemented"
else
    eww --config ~/.config/eww/widgets/powermenu/ close powermenu
    exit
fi

eww --config ~/.config/eww/widgets/powermenu/ close powermenu

