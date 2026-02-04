#!/bin/bash

DEVICE="04ca00a0:00-04ca:00b1-touchpad"
STATE_FILE="/tmp/touchpad_state"

# Si le fichier n'existe pas, on considère qu'il est activé (1)
if [ ! -f "$STATE_FILE" ]; then
    echo "1" > "$STATE_FILE"
fi

CURRENT_STATE=$(cat "$STATE_FILE")

if [ "$CURRENT_STATE" = "0" ]; then
    # Était désactivé -> on l'active
    hyprctl keyword "device[$DEVICE]:enabled" true
    echo "1" > "$STATE_FILE"
    swayosd-client --custom-message "Touchpad On" --custom-icon "touchpad-enabled-symbolic"
else
    # Était activé -> on le désactive
    hyprctl keyword "device[$DEVICE]:enabled" false
    echo "0" > "$STATE_FILE"
    swayosd-client --custom-message "Touchpad Off" --custom-icon "touchpad-disabled-symbolic"
fi
