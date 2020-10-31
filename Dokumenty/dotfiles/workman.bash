#!/usr/bin/env bash
set -euo pipefail

if [ $(setxkbmap -query | grep variant | wc -l) -eq '0' ]; then
    setxkbmap pl -variant workman && xset r 66
else
    setxkbmap pl && xset -r 66
fi
