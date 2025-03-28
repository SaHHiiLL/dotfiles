#!/usr/bin/env bash

# https://github.com/arfan-on-clouds/hyprclouds/blob/dc56aa5563da58ba1fd757c607a8630493686647/config/eww/scripts/volume.sh
pamixer --get-volume

pactl subscribe | rg --line-buffered "on sink" | while read -r _; do
  pamixer --get-volume-human | tr -d '%'
done
