#!/usr/bin/env bash
set -euo pipefail

if [ $(setxkbmap -query | wc -l) -eq '4' ]; then
    setxkbmap pl -variant workman && xset r 66
else
    setxkbmap pl && xset -r 66
fi
