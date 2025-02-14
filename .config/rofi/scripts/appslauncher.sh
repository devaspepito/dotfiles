#!/usr/bin/env bash

pkill -x rofi || rofi -show run -config "$HOME/.config/rofi/appslauncher.rasi"
