#!/usr/bin/env bash
#
path=$($HOME/.config/scripts/faster_cd/listfiles.py | fzf)

if [[ $path ]]; then
    cd $path
fi

$SHELL
