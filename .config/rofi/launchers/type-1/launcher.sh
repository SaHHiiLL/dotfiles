#!/usr/bin/env bash

## Author : Aditya Shakya (adi1090x)
## Github : @adi1090x
#
## Rofi   : Launcher (Modi Drun, Run, File Browser, Window)
#
## Available Styles
#
## style-1     style-2     style-3     style-4     style-5
## style-6     style-7     style-8     style-9     style-10
## style-11    style-12    style-13    style-14    style-15

dir="$HOME/.config/rofi/launchers/type-1"
theme='style-6'

## Run
if [ $XDG_CURRENT_DESKTOP = "sway" ]; then
    /home/Sahil/GitClones/rofi/build/rofi \
        -show drun \
        -theme ${dir}/${theme}.rasi
elif [ $XDG_CURRENT_DESKTOP = "Hyprland" ]; then
    /home/Sahil/GitClones/rofi/build/rofi \
        -show drun \
        -theme ${dir}/${theme}.rasi
else
    rofi \
        -show drun \
        -theme ${dir}/${theme}.rasi
fi
