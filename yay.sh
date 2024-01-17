#!/bin/bash

cd
git clone https://aur.archlinux.org/yay 
cd yay
makepkg -si 

echo "Installing Rofi..."
    yay -S rofi-lbonn-wayland-git
echo "Installing Sway Lock Effects..."
    yay -S sway-lock-effects-git
echo "Installing nwg-look..."
    yay -S nwg-look
echo "Installing kvantum..."
    yay -S kvantum-qt5-git
echo "Installing Network Manager Dmenu"
	yay -S networkmanager-dmenu-git
echo "Installing XFCE Polkit"
	yay -S xfce-polkit-git
echo "Installing Kora Icon & Bibata Cursor"
	yay -S kora-icon-theme bibata-cursor-theme
