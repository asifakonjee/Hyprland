#!/usr/bin/env bash

## Script To Apply Themes

## Theme ------------------------------------
THEME="simple"

source "$HOME"/.config/hypr/themes/"$THEME"/theme.bash
altbackground="`pastel color $background | pastel lighten $light_value | pastel format hex`"
altforeground="`pastel color $foreground | pastel darken $dark_value | pastel format hex`"

## Directories ------------------------------
PATH_CONF="$HOME/.config"
PATH_DUNST="$PATH_CONF/dunst"
PATH_GEANY="$PATH_CONF/geany"
PATH_ROF="$PATH_CONF/rofi"
PATH_GTK="$HOME/.local/share/nwg-look"

# Geany -------------------------------------
apply_geany() {
	sed -i ${PATH_GEANY}/geany.conf \
		-e "s/color_scheme=.*/color_scheme=$geany_colors/g" \
		-e "s/editor_font=.*/editor_font=$geany_font/g"
}

# Appearance --------------------------------
apply_appearance() {
	# apply gtk theme, icons, cursor & fonts
	sed -i ${PATH_GTK}/gsettings \
		-e "s/gtk-theme=.*/gtk-theme=$gtk_theme/g" \
		-e "s/icon-theme=.*/icon-theme=$icon_theme/g" \
		-e "s/font-name=.*/font-name=$gtk_font/g" \
		-e "s/cursor-theme=.*/cursor-theme=$cursor_theme/g"
	nwg-look -a
	
	# inherit cursor theme
	if [[ -f "$HOME"/.icons/default/index.theme ]]; then
		sed -i -e "s/Inherits=.*/Inherits=$cursor_theme/g" "$HOME"/.icons/default/index.theme
	fi	
}

# Dunst -------------------------------------
apply_dunst() {
	# modify dunst config
	sed -i ${PATH_DUNST}/dunstrc \
		-e "s/width = .*/width = $dunst_width/g" \
		-e "s/height = .*/height = $dunst_height/g" \
		-e "s/offset = .*/offset = $dunst_offset/g" \
		-e "s/origin = .*/origin = $dunst_origin/g" \
		-e "s/font = .*/font = $dunst_font/g" \
		-e "s/frame_width = .*/frame_width = $dunst_border/g" \
		-e "s/separator_height = .*/separator_height = $dunst_separator/g" \
		-e "s/line_height = .*/line_height = $dunst_separator/g"

	# modify colors
	sed -i '/urgency_low/Q' ${PATH_DUNST}/dunstrc
	cat >> ${PATH_DUNST}/dunstrc <<- _EOF_
		[urgency_low]
		timeout = 2
		background = "${background}"
		foreground = "${foreground}"
		frame_color = "${color16}"

		[urgency_normal]
		timeout = 5
		background = "${background}"
		foreground = "${foreground}"
		frame_color = "${color16}"

		[urgency_critical]
		timeout = 0
		background = "${background}"
		foreground = "${color1}"
		frame_color = "${color1}"
	_EOF_

	# restart dunst
	pkill dunst && dunst &
}

apply_rofi() {
	# modify icon theme
	if [[ -f "$PATH_ROF"/config.rasi ]]; then
		sed -i -e "s/icon-theme:.*/icon-theme: \"$rofi_icon\";/g" ${PATH_CONF}/rofi/config.rasi
	fi
	# modify rofi scripts
	sed -i ${PATH_ROF}/bin/themes -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/launcher -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/music -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/powermenu -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/screenshot -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/screenrecord -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/asroot -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/askpass -e "s/STYLE=.*/STYLE=\"$THEME\"/g"
	sed -i ${PATH_ROF}/bin/network_menu \
		-e "s/CONF.read.*/CONF.read\(expanduser\(\"\~\/\.config\/hypr\/themes\/$THEME\/rofi\/networkmenu_config.ini\"\)\)/g"

	}

# Notify User -------------------------------
notify_user() {
	dunstify -u normal -h string:x-dunst-stack-tag:applytheme -i /usr/share/icons/dunst/themes.png "Applying Style : $THEME"
}	

## Execute Script ---------------------------
apply_geany
apply_appearance
apply_dunst
apply_rofi
notify_user
