#!/bin/bash
 
killall pipewire pipewire-pulse wireplumber waybar

sleep 1
/usr/bin/pipewire & /usr/bin/pipewire-pulse & /usr/bin/wireplumber & disown
sleep 2
waybar -c ~/.config/hypr/waybar/config -s ~/.config/hypr/waybar/style.css & disown
