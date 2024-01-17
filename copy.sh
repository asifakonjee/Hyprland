#!/bin/bash

sudo cp -r usr/share/fonts/* /usr/share/fonts/
sudo cp -r usr/share/themes/* /usr/share/themes/
sudo cp -r usr/share/sddm/themes/* /usr/share/sddm/themes/
sudo fc-cache -fv
cp -r config/* ~/.config/
