#!/usr/bin/env bash

pkill -x rofi || rofi -show drun -config "$HOME/.config/rofi/launcherapp.rasi"
