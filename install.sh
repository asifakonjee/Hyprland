#!/bin/bash

echo "Welcome to a simple script to get a minimally customised Hyprland on Arch/Artix Linux."
read -p "Would you like to continue (y/n)? " installChoice

case "$installChoice" in
  # User wants to continue installation
  y|Y|yes|Yes|YES )

    read -p "Would you like to perform a system upgrade before continuing (y/n)? " upgradeChoice
    case "$upgradeChoice" in
      y/Y/yes/Yes/YES )
        echo "Upgrading system..."
        sudo pacman -Syu
      ;;
      n/N/no/No/NO )
        echo "Skipping system upgrade."
      ;;
    esac
    
    echo "Installing Hyprland..."
      sudo pacman -S hyprland xdg-desktop-portal-hyprland waybar

    echo "Preparing to install other packages..."
      
      echo "Installing build essentials and kernel headers..."
        sudo pacman -S base-devel git 
      
      echo "Installing other applications..."
        sudo pacman -S qt5-graphicaleffects qt5-quickcontrols2 qt5-wayland qt6-wayland qt5ct qt6ct qt5-svg inetutils brightnessctl
      
      echo "Installing audio and bluetooth packages..."
        sudo xbps-install  alsa-utils ffmpeg ffmpegthumbs pipewire pipewire-pulse pipewire-jack pipewire-audio wireplumber pavucontrol bluez blueman pulsemixer
      
      echo "Installing file managers..."
        sudo pacman -S thunar thunar-volman thunar-media-tags-plugin thunar-archive-plugin xdg-user-dirs xdg-utils gvfs-mtp
      
      echo "Installing utilities and system tools..."
        sudo pacman -S dunst swayidle swaybg libsixel wl-clipboard gvfs-mtp plymouth tlp tlp-rdw
      
      echo "Installing additional applications..."
        sudo pacman -S neofetch htop konsole foot timeshift qt5-devel exa bat grub-customizer hplip qbittorrent
        
        # Edit the following list of additional applications or replace them with your own preferences
        
        # Code editor
        echo "Installing Text Editors..."
        sudo pacman -S micro geany
        
        # PDF reader
        echo "Installing PDF Viewer..."
        sudo pacman -S okular
        
        # Web browser
        echo "Installing Firefox..."
        sudo pacman -S firefox
        
        # Screenshot utility
        echo "Installing Screenshot Utility..."
        sudo pacman -S grim slurp jq
        
        # Image editor
        echo "Installing Image Viewer..."
        sudo pacman -S gwenview
        
        # Office suite
        echo "Installing LibreOffice..."
        sudo pacman -S libreoffice-fresh
        
        # Audio and video player
        echo "Installing Video Player..."
        sudo pacman -S mpv
        
        # Audio recording and streaming
        echo "Installing Screen Recording Applications..."
        sudo pacman -S obs-studio wf-recorder
        
                
    echo "Configuring system..."
      echo "Setting up services..."
        sudo systemctl enable sddm.service
        sudo systemctl enable bluetooth.service
        sudo systemctl enable tlp.service
        
	  echo "Starting services..."
		sudo systemctl start sddm.service
        sudo systemctl start bluetooth.service
        sudo systemctl start tlp.service
        
    echo "All done! Please reboot for all changes to take effect."
  ;;

  # User does not want to continue installation.
  n|N|no|No|NO )
    echo "Thanks for trying, Goodbye!";;
esac
