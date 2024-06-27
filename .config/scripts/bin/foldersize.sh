#!/usr/bin/env bash

if [ -z "$1" ]
then
    echo "Please Provide a folder to check"
else
    du -cha --max-depth=1 $1 2> /dev/null | grep -E "M|G" 2> /dev/null
fi
