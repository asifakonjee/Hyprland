#!bin/bash

sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay
cd paru
makepkg -si
