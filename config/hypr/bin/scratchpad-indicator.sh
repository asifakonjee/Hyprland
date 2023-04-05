#!/bin/bash
# Scratchpad indicator for Hyprland

output="$(hyprctl clients -j | jq -r '.[] | select(.workspace.id==-99) |"<b>"+.class+"</b> : <i>"+.title+"</i>"')"
number="$(hyprctl clients -j | jq -r '.[] | select(.workspace.id==-99) | (tostring)' | wc -l)"
file=~/.config/hypr/waybar/style.css

if [ "$number" -gt 0 ]; then
    text="缾 $number"
else
    text=""
fi

output="$(echo "$output" | sed -r 's/[&]+/and/g')" # Replace unprintable & character with the word 'and'
tooltip="\n"
tooltip+="$(echo "$output" | sed -z 's/\n/\\n/g')"
tooltip=${tooltip::-2}

function ShowInfo() {
	if [ "$number" -eq 0 ]; then
		exit
	else
	tooltip="$(echo -e $tooltip)"
	notify-send "缾 Scratchpad" "$tooltip" -r 123
	fi
}

function Update() {
	printf "%s" "$text"
}

if [ "$1" = "ShowInfo" ]; then
	ShowInfo
else
	Update	
fi
