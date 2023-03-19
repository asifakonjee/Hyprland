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
sudo pacman -S gdb ninja gcc cmake libxcb xcb-proto xcb-util-keysyms libxfixes libx11 \
libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd \
libxkbcommon xcb-util-wm xorg-xwayland libinput

git clone --recursive https://github.com/hyprwm/Hyprland.git
cd Hyprland/
sudo make install

Paru -S git sddm-git waybar-hyprland alacritty rofi thunar gvfs-mtp swayidle \
swaybg swaylock-effects-git wl-clipboard networkmanager-dmenu-git \
xfce-polkit dunst geany viewnior nwg-look xdg-desktop-portal-hyprland-git qt5-svg inetutils \
xdg-user-dirs pulsemixer pavucontrol qt5-graphicaleffects qt5-quickcontrols2 \
pipewire wireplumber grim slurp jq dunst qt5-wayland qt6-wayland
```
N.B.- Some points during installation. 
1. If you choose to install hyprland-git using paru choose rustup as dependency.
2. If it gives error, then install build from source according to offcial wiki guideline (Best way till now!).
3. During installation of xdg-desktop-portal-hyprland-git, choose xdg-desktop-portal-wlr, otherwise hyprland will not start. Make sure that you don't have other xdg-desktop-portals. 

### Please READ the Hyprland wiki FIRST. Don't blindly copy/paste this repo.

# IMPORTANT: These configuration files will work on Hyprland 0.22 version. I haven't tested them in the latest 0.23 version!

### Copy Configuration and stuff
1. Copy the contents of config to .config
2. Copy the content of etc to your /etc folder. Don't copy the folder and paste it into /etc! It will break the system. Copy the content.
3. Copy the contents of usr to the respective folders fo /usr/share folder. Don't copy the folder and paste into /usr/share! It will also break your system. Copy the contents to the respective folder.
