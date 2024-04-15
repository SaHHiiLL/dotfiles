#!/usr/bin/env sh
set -x

killall waybar

if [ $XDG_CURRENT_DESKTOP = "Hyprland" ] ; then
    waybar &
else
    waybar --config ~/.config/waybar/config.sway &
fi
