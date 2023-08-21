#!/bin/env bash

# Set the directory where your videos are stored
video_dir="/home/asifakonjee/Downloads/Torrents/"
video_location="$(ls "$video_dir" | sort | rofi -dmenu -hover-select -me-select-entry '' -me-accept-entry MousePrimary)"

if [[ -d $video_dir/$video_location ]]; then
    video_temp="$video_location"
elif [[ -f $video_dir/$video_location ]]; then
	mpv "$video_dir"/"$video_temp"/"$video_location"
else
    exit 1
fi
