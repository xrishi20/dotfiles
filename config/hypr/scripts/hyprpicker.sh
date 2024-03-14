#!/bin/sh
hyprpicker --format hex | head -c -1 | wl-copy
dunstify "$(wl-paste)"  "Copied to your clipboard!"
