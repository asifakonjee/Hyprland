#!/usr/bin/env bash

## Copyright (C) 2020-2022 Aditya Shakya <adi1090x@gmail.com>
##
## Script To Apply Themes

## Theme ------------------------------------
THEME="catppuccin"

source "$HOME"/.config/themes/"$THEME"/theme.bash
altbackground="`pastel color $element_bg | pastel darken $dark_value | pastel format hex`"
altforeground="`pastel color $element_fg | pastel lighten $light_value | pastel format hex`"

## Directories ------------------------------
PATH_CONF="$HOME/.config"
PATH_TERM="$PATH_CONF/alacritty"
PATH_DUNST="$PATH_CONF/dunst"
PATH_GEANY="$PATH_CONF/geany"
PATH_WBR="$PATH_CONF/themes/$THEME/waybar"
PATH_XFCE="$PATH_CONF/xfce4/terminal"
PATH_ROF="$PATH_CONF/rofi"
PATH_GTK="$HOME/.local/share/nwg-look"

## Waybar -----------------------------------
apply_waybar() {
	# launch waybar
	pkill waybar
	waybar -c ${PATH_WBR}/config -s ${PATH_WBR}/style.css &
}

# Terminal ----------------------------------
apply_terminal() {
	# alacritty : fonts
	sed -i ${PATH_TERM}/fonts.yml \
		-e "s/family: .*/family: \"$terminal_font_name\"/g" \
		-e "s/size: .*/size: $terminal_font_size/g"

	# alacritty : colors
	sed -i ${PATH_TERM}/alacritty.yml -e "s/opacity: .*/opacity: ${terminal_opacity}/g"
	cat > ${PATH_TERM}/colors.yml <<- _EOF_
		## Colors configuration
		colors:
		  # Default colors
		  primary:
		    background: '${background}'
		    foreground: '${foreground}'

		  # Normal colors
		  normal:
		    black:   '${color0}'
		    red:     '${color1}'
		    green:   '${color2}'
		    yellow:  '${color3}'
		    blue:    '${color4}'
		    magenta: '${color5}'
		    cyan:    '${color6}'
		    white:   '${color7}'

		  # Bright colors
		  bright:
		    black:   '${color8}'
		    red:     '${color9}'
		    green:   '${color10}'
		    yellow:  '${color11}'
		    blue:    '${color12}'
		    magenta: '${color13}'
		    cyan:    '${color14}'
		    white:   '${color15}'
	_EOF_

	# xfce terminal : fonts & colors
	sed -i ${PATH_XFCE}/terminalrc \
		-e "s/FontName=.*/FontName=$terminal_font_name $terminal_font_size/g" \
		-e "s/ColorBackground=.*/ColorBackground=${background}/g" \
		-e "s/ColorForeground=.*/ColorForeground=${foreground}/g" \
		-e "s/ColorCursor=.*/ColorCursor=${foreground}/g" \
		-e "s/ColorPalette=.*/ColorPalette=${color0};${color1};${color2};${color3};${color4};${color5};${color6};${color7};${color8};${color9};${color10};${color11};${color12};${color13};${color14};${color15}/g"
}

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
		background = "${element_bg}"
		foreground = "${element_fg}"
		frame_color = "${color15}"

		[urgency_normal]
		timeout = 5
		background = "${element_bg}"
		foreground = "${element_fg}"
		frame_color = "${color15}"

		[urgency_critical]
		timeout = 0
		background = "${element_bg}"
		foreground = "${color9}"
		frame_color = "${color9}"
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
		-e "s/CONF.read.*/CONF.read\(expanduser\(\"\~\/\.config\/themes\/$THEME\/rofi\/networkmenu_config.ini\"\)\)/g"

	}

# Notify User -------------------------------
notify_user() {
	dunstify -u normal -h string:x-dunst-stack-tag:applytheme -i /usr/share/icons/dunst/themes.png "Applying Style : $THEME"
}
	
## Execute Script ---------------------------
apply_waybar
apply_terminal
apply_geany
apply_appearance
apply_dunst
apply_rofi
notify_user
