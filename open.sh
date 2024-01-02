#!/usr/bin/env bash

d=("$HOME/programing/rust" "$HOME/programing/frontend" "$HOME" "$HOME/.config" "$HOME/dotfile")

# get length of an array
arraylength=${#d[@]}

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
  d+=$(echo $(ls -d ${d[$i]}/*/) )
done

for (( i=0; i<${arraylength}; i++ ));
do
  echo ${d[$i]} | sed 's/ /\n/g'
done



# ls | sed 's/ /\n/g' | fzf
