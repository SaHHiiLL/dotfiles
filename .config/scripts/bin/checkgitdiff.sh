#!/bin/env bash

if [[ !$(git -C ~/dotfile/ diff-index --quiet HEAD --) ]]; then
    notify-send "Uncommited files in \"~/dotfile/ \""
fi
