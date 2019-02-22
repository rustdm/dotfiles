#!/bin/bash

PACKAGE_LIST="xorg-xinit i3-gaps i3status dmenu networkmanager termite compton ranger noto-fonts-extra noto-fonts-emoji feh firefox neofetch"

sudo yes | pacman -Syu
sudo yes "1" | pacman -S xorg-server
sudo yes | pacman -S $PACKAGE_LIST

WALLPAPER="paul-earle-39322-unsplash.jpg"

echo "feh --bg-scale '$PWD/$WALLPAPER'" > .fehbg 

cp -v .xinitrc /root/
cp -v .fehbg   /root/

cd i3
cp -v config /root/.config/i3/

mkdir /root/.config/termite/
cp /etc/xdg/termite/config ~/.config/termite/config

cd ..
cd termite
cp -v config /root/.config/termite/
