#!bin/bash

sudo pacman -S base-devel -y
git clone https://aur.archlinux.org/yay
cd paru
makepkg -si
