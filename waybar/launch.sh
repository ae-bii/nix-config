#!/usr/bin/env bash

killall waybar


# if [[ $USER = "anu" ]]
# then
#     waybar -c ~/nix-config/waybar/theme-config & -s ~/nix-config/waybar/style.css
# else
#     waybar &
# fi

waybar -c ~/nix-config/waybar/theme-config & -s ~/nix-config/waybar/style.css
