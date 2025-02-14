#!/usr/bin/env bash

pkill -x rofi || cliphist list | rofi -dmenu -p " " -display-columns 2 -config "$HOME/.config/rofi/clipboard.rasi" | cliphist decode | xclip -selection clipboard
