#!/bin/bash
OFF_VALUE=0
LOW_VALUE=127
HIGH_VALUE=255

current_brightness=$(brightnessctl -d kbd_backlight get)


if [ $current_brightness -lt $LOW_VALUE ]; then
    echo "switching to low"
    brightnessctl -d kbd_backlight set $LOW_VALUE
elif [ $current_brightness -lt $HIGH_VALUE ]; then
    echo "switching to high"
    brightnessctl -d kbd_backlight set $HIGH_VALUE
elif [ $current_brightness -eq $HIGH_VALUE ]; then
    echo "switching to off"
    brightnessctl -d kbd_backlight set $OFF_VALUE
fi
