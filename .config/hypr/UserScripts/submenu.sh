#!/bin/bash

options="\n\n\n\n\n"

chosen=$(echo -e "$options" | rofi -config ~/.config/rofi/submenu.rasi -dmenu -p  "Select an option:")

case $chosen in
    "")
        rofi -show drun
        ;;
    "")
        thunar
        ;;
    "")
        wlogout
        ;;
    "")
        alacritty
        ;;
    "")
        xdg-open https://about:blank
        ;;
    "")
        ~/.config/hypr/scripts/help
        ;;
    *)
        echo "No option selected"
        ;;
esac
