# Hyprland on Arch linux

**Dr. Asifur Rahman Akonjee**

## Requirements
1. Arch Linux Base Install
2. Paru

### Paru

Run as user NOT ROOT!

```
sudo pacman -S base-devel
git clone https://aur.archlinux.org/paru
cd paru
makepkg -si
```

### Packages

``` bash
Paru -S git sddm-git hyprland-git waybar-hyprland alacritty rofi thunar gvfs-mtp swayidle \
swaybg swaylock-effects-git wl-clipboard networkmanager-dmenu-git \
xfce-polkit dunst geany viewnior nwg-look xdg-desktop-portal-hyprland-git qt5-svg inetutils \
xdg-user-dirs pulsemixer pavucontrol qt5-graphicaleffects qt5-quickcontrols2 \
pipewire wireplumber grim slurp jq dunst qt5-wayland qt6-wayland
```
### Please READ the Hyprland wiki FIRST. Don't blindly copy/paste this repo.

### Copy Configuration and stuff
1. Copy the contents of config to .config
2. Copy the content of etc to your /etc folder. Don't copy the folder and paste it into /etc! It will break the system. Copy the content.
3. Copy the contents of usr to the respective folders fo /usr/share folder. Don't copy the folder and paste into /usr/share! It will also break your system. Copy the contents to the respective folder.
