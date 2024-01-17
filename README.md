# Hyprland on Arch linux

**Dr. Asifur Rahman Akonjee**

My youtube channel: https://www.youtube.com/@dr.asifakonjee

My github repo: https://www.github.com/asifakonjee

## CAUTION: Please READ the Hyprland wiki FIRST. Don't blindly copy/paste this repo.

## Hyprland is now on Arch repository!

## Requirements
1. Arch Linux Base Install
2. yay

### Install Hyprland

```
sudo pacman -S hyprland xdg-desktop-portal-hyprland waybar konsole foot libsixel sddm thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin gvfs-mtp swayidle \
swaybg wl-clipboard dunst geany gwenview okular qt5-svg inetutils \
xdg-user-dirs pavucontrol qt5-graphicaleffects qt5-quickcontrols2 mpv micro pipewire pipewire-audio pipewire-pulse pipewire-jack pulsemixer wireplumber bluez blueman brightnessctl \
grim slurp jq dunst qt5-wayland qt6-wayland qt5ct qt6ct ffmpeg ffmpegthumbs \
```

### Yay

Run as user NOT ROOT!

```
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/yay
cd paru
makepkg -si
```

### Packages

``` bash
yay -S rofi-lbonn-wayland-git swaylock-effects-git networkmanager-dmenu-git \
xfce-polkit-git nwg-look kvantum-qt5-git kora-icon-theme bibata-cursor-theme
```

### Copy Configuration and stuff
1. Copy the contents of config to .config
2. Copy the content of etc to your /etc folder. Don't copy the folder and paste it into /etc! It will break the system. Copy the content.
3. Copy the contents of usr to the respective folders fo /usr/share folder. Don't copy the folder and paste into /usr/share! It will also break your system. Copy the contents to the respective folder.
4. Move ~/.config/rofi/simple.rasi to /usr/share/rofi/themes folder.
5. Default layout is master (not dwindle) but you can change that in `~/.config/hypr/themes/simple/myColors.conf`
6. If you are going to use Hyprland only then add these lines to `/etc/environment`

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

 - <kbd>MOD</kbd><kbd>+</kbd><kbd>Return</kbd> = Open Default terminal (Foot terminal)
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>SHIFT</kbd><kbd>+</kbd><kbd>Return</kbd> = Open Konsole (floating)
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>w</kbd> = Open Browser (Firefox)
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>f</kbd> = Open File Manager (Thunar)
 - <kbd>ALT(RIGHT)</kbd> = Open Launcher (Rofi)
 - <kbd>ALT(LEFT)</kbd><kbd>+</kbd><kbd>w</kbd> = Open active window list
- <kbd>MOD</kbd><kbd>+</kbd><kbd>s</kbd> = Screenshot menu
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>x</kbd> = Power-menu
 - <kbd>ALT(RIGHT)</kbd><kbd>+</kbd><kbd>p</kbd> = Wallpaper_picker menu
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>c</kbd> = Close focused app [kill]
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>n</kbd> = Open network manager
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>r</kbd> = Open apps as root
 - <kbd>ALT(RIGHT)</kbd><kbd>+</kbd><kbd>Space</kbd>  = Float window
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>b</kbd> = Hide Waybar
 - <kbd>MOD</kbd><kbd><kbd>+</kbd></kbd><kbd>SHIFT</kbd><kbd>+</kbd><kbd>b</kbd> = Restart Waybar
 - <kbd>MOD</kbd><<kbd>+</kbd><kbd>HOLD DOWN LEFT MOUSE BUTTON</kbd> = Drag floating window
 - <kbd>MOD</kbd><kbd>+</kbd><kbd>↑ ↓ → ←</kbd>  = Switch focus respectively 
 
Other keybindings are at `~/.config/hypr/keybind.conf`

Welcome to the Hyparland and Enjoy!

# Scripts are in "Beta", Please Don't use now without advanced knowledge.

```
sudo chmod +x install.sh
sudo chmod +x yah.sh
sudo chmod +x copy.sh

./install.sh
./yay.sh
./copy.sh
```
## Screnshots

<div align = center><img src="https://raw.githubusercontent.com/asifakonjee/Hyprland/main/source/assets/hyprland.png"><br><br>
<div align = center><img src="https://raw.githubusercontent.com/asifakonjee/Hyprland/main/source/assets/Rofi.jpg"><br><br>
