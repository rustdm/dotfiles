#!/bin/bash

# sed 's+root+home/david+g' build.sh > buildUser.sh

PACKAGE_LIST="xorg-server xorg-xinit i3-gaps i3status dmenu networkmanager termite compton ranger noto-fonts-extra noto-fonts-emoji feh firefox neofetch pulseaudio pavucontrol"
PKG_UPDATE="pacman -Syu"
PKG_INSTALL="pacman -S"

sudo yes | $PKG_UPDATE
sudo yes "1" | $PKG_INSTALL xorg-server
sudo yes | $PKG_INSTALL $PACKAGE_LIST

WALLPAPER="paul-earle-39322-unsplash.jpg"

echo "feh --bg-scale '$PWD/$WALLPAPER'" > .fehbg 

cp -v .xinitrc /root/
cp -v .fehbg   /root/
cp -v .nanorc  /root/

mkdir -p /root/.config/i3/
cp -v i3/* /root/.config/i3

mkdir -p /root/.config/termite/
cp /etc/xdg/termite/config ~/.config/termite/config

cp -v termite/config /root/.config/termite
