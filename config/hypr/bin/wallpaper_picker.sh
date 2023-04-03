#!/bin/env bash

wallpaper_folder=$HOME/.config/hypr/bg/
wallpaper_location="$(ls "$wallpaper_folder" | rofi -dmenu)"


if [[ -d $wallpaper_folder/$wallpaper_location ]]; then
    # echo "$wallpaper_folder/$wallpaper_location is a directory"
    wallpaper_temp="$wallpaper_location"
    # wallpaper_location="$(ls $wallpaper_folder/$wallpaper_location | rofi -dmenu)"
elif [[ -f $wallpaper_folder/$wallpaper_location ]]; then
	swaybg -m fill -i "$wallpaper_folder"/"$wallpaper_temp"/"$wallpaper_location"
else
    exit 1
fi
