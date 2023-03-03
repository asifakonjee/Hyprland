#!/usr/bin/env bash
# Screenshot
time=`date +%Y-%m-%d-%H-%M-%S`
dir="Pictures/Screenshots"
file="Screenshot_${time}.png"

# Directory
if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# notify and view screenshot
notify_view() {
	notify_cmd_shot='dunstify -u low -h string:x-dunst-stack-tag:obscreenshot -i /usr/share/icons/dunst/picture.png'
	${notify_cmd_shot} "Copied to clipboard."
	paplay /usr/share/sounds/freedesktop/stereo/screen-capture.oga &>/dev/null &
	viewnior ${dir}/"$file"
	if [[ -e "$dir/$file" ]]; then
		${notify_cmd_shot} "Screenshot Saved."
	else
		${notify_cmd_shot} "Screenshot Deleted."
	fi
}

# Copy screenshot to clipboard
copy_shot () {
	wl-copy
}

# countdown
countdown () {
	for sec in `seq $1 -1 1`; do
		dunstify -t 1000 -h string:x-dunst-stack-tag:screenshottimer -i /usr/share/archcraft/icons/dunst/timer.png "Taking shot in : $sec"
		sleep 1
	done
}

# take shots
shotnow () {
	sleep 0.5 && grim "$dir/$file"
	copy_shot < "$dir/$file"
	notify_view
}

# Exec script
shotnow

