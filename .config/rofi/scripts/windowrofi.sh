#!/usr/bin/env bash

pkill -x rofi || rofi -show window -config "$HOME/.config/rofi/windowswitcher.rasi"
