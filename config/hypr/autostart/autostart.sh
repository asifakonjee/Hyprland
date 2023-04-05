#!/usr/bin/env bash

## Autostart Programs

# Kill already running process
_ps=(swaybg swayidle waybar dunst xdg-desktop-portal-hyprland xdg-desktop-portal xfce-polkit)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Swayidle
exec swayidle -w timeout 1200 'exec ~/.config/hypr/bin/lock.sh' timeout 1800 'systemctl suspend' &

# Waybar
exec waybar -c ~/.config/hypr/waybar/config -s ~/.config/hypr/waybar/style.css &

# Etc
sleep 1
/usr/libexec/xdg-desktop-portal-hyprland &
sleep 2
/usr/lib/xdg-desktop-portal &
xdg-user-dirs-update
fcitx5 &
