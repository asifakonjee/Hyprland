#!/bin/bash

sudo cp -r ~/Hyprland/usr/share/fonts/* /usr/share/fonts/
sudo cp -r ~/Hyprland/usr/share/themes/* /usr/share/themes/
sudo cp -r ~/Hyprland/usr/share/sddm/themes/* /usr/share/sddm/themes/
sudo fc-cache -fv
cp -r ~/Hyprland/config/* ~/.config/
sudo mv ~/.config/rofi/simple.rasi /usr/share/rofi/themes/
