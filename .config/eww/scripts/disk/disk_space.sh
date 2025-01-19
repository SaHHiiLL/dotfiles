#!/bin/env bash
set -xa
used=$(df -h --output=used $1 | tail -n 1 | cut -c3-)
avail=$(df -h --output=size $1 | tail -n 1 | cut -c2-)
printf "$used / $avail"
