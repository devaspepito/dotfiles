#!/usr/bin/env bash

pkill -x rofi || rofi -show emoji -modi emoji -config "$HOME/.config/rofi/emoji.rasi"
