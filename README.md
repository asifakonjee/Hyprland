# Hyprland version 0.23 on Arch linux

**Dr. Asifur Rahman Akonjee**

My youtube channel: https://www.youtube.com/@dr.asifakonjee

My github repo: https://www.github.com/asifakonjee

## CAUTION: Please READ the Hyprland wiki FIRST. Don't blindly copy/paste this repo.

## Hyprland is now on Arch repository!

## Requirements
1. Arch Linux Base Install
2. Paru

### Install Hyprland

```
sudo pacman -S hyprland
```

### Paru

Run as user NOT ROOT!

```
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/paru
cd paru
makepkg -si
```

### Packages

``` bash
paru -S sddm-git waybar-hyprland alacritty-sixel-git foot libsixel rofi-lbonn-wayland-git thunar gvfs-mtp swayidle \
swaybg swaylock-effects-git wl-clipboard networkmanager-dmenu-git \
xfce-polkit dunst geany viewnior nwg-look xdg-desktop-portal-hyprland-git qt5-svg inetutils \
xdg-user-dirs pavucontrol qt5-graphicaleffects qt5-quickcontrols2 \
pipewire wireplumber grim slurp jq dunst qt5-wayland qt6-wayland qt5ct qt6ct kvantum kvantum-qt5-git kvantum-qt6-git
```
N.B.- During installation of xdg-desktop-portal-hyprland-git (XDPH) using paru, it may install other portals like xdg-desktop-portal-wlr. Please uninstall those. Only xdg-desktop-portal-gtk will work with XDPH.  

### If you want to build Hyprland from source then follow these steps after installing Paru.

```
sudo pacman -S gdb ninja gcc cmake libxcb xcb-proto xcb-util-keysyms libxfixes libx11 \
libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd \
libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info


git clone --recursive https://github.com/hyprwm/Hyprland.git
cd Hyprland/
sudo make install
```
# IMPORTANT: These configuration files will work on Hyprland 0.23 version.

### Copy Configuration and stuff
1. Copy the contents of config to .config
2. Copy the content of etc to your /etc folder. Don't copy the folder and paste it into /etc! It will break the system. Copy the content.
3. Copy the contents of usr to the respective folders fo /usr/share folder. Don't copy the folder and paste into /usr/share! It will also break your system. Copy the contents to the respective folder.
4. Default layout is master (not dwindle) but you can change that in `~/.config/hypr/themes/simple/myColors.conf`
5. If you are going to use Hyprland only then add these lines to `/etc/environment`

``` bash
MOZ_ENABLE_WAYLAND=1
QT_QPA_PLATFORMTHEME=qt5ct
QT_QPA_PLATFORM=wayland
QT_WAYLAND_DISABLE_WINDOWDECORATION=1
QT_AUTO_SCREEN_SCALE_FACTOR=1
```
Reference:
1. https://github.com/hyprwm/Hyprland
2. https://wiki.hyprland.org/
3. https://github.com/wildan-pratama/wildan-hyprland
4. https://github.com/arcolinux/arcolinux-hyprland

## Main shortcuts: 

<kbd>MOD</kbd> key is set to the <kbd>WINKEY</kbd>/<kbd>SUPER</kbd>

 - <kbd>MOD</kbd>+<kbd>Return</kbd> = open terminal (Foot terminal)
 - <kbd>MOD</kbd>+<kbd>A</kbd> = open Alacritty
 - <kbd>MOD</kbd>+<kbd>SHIFT</kbd>+<kbd>Return</kbd> = open Alacritty (floating)
 - <kbd>MOD</kbd>+<kbd>W</kbd> = open Browser (Firefox)
 - <kbd>MOD</kbd>+<kbd>F</kbd> = open File Manager (Thunar)
 - <kbd>ALT(LEFT)</kbd> = open Launcher (Rofi)
 - <kbd>ALT(LEFT)</kbd>+<kbd>W</kbd> = open active window list
- <kbd>MOD</kbd>+<kbd>S</kbd> = screenshot menu
 - <kbd>MOD</kbd>+<kbd>X</kbd> = power-menu
 - <kbd>ALT(RIGHT)</kbd>+<kbd>P</kbd> = wallpaper_picker menu
 - <kbd>MOD</kbd>+<kbd>C</kbd> = close focused app [kill]
 - <kbd>MOD</kbd>+<kbd>N</kbd> = open network manager
 - <kbd>MOD</kbd>+<kbd>R</kbd> = open apps as root
 - <kbd>ALT(RIGHT)</kbd>  = float window
 - <kbd>MOD</kbd>+<kbd>B</kbd> = hide Waybar
 - <kbd>MOD</kbd>+<kbd>HOLD DOWN</kbd> = drag floating window
 - <kbd>MOD</kbd>+<kbd>↑ ↓ → ←</kbd>  = switch focus respectively 
 
Other keybindings are at `~/.config/hypr/keybind.conf`

Welcome to the Hyparland and Enjoy!
