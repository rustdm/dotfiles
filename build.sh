#!/bin/bash

# if the currently logged in user is not root replace every occurrance of "root" in the script with "home/user"
#sed 's+root+home/david+g' build.sh > buildUser.sh

USER=$(whoami)

if [ $(whoami) != 'root' ]
then
	BASE="/home/$USER/"
else
	BASE="/root/"
fi

PACKAGE_LIST="xorg-server xorg-xinit i3-gaps i3status dmenu networkmanager termite vim picom ranger noto-fonts-extra noto-fonts-emoji feh firefox neofetch pulseaudio pavucontrol acpilight"
PKG_UPDATE="pacman -Syu"
PKG_INSTALL="pacman -S"

yes | $PKG_UPDATE
yes "1" | $PKG_INSTALL xorg-server
yes | $PKG_INSTALL $PACKAGE_LIST

WALLPAPER="paul-earle-39322-unsplash.jpg"

bash -c "echo \"feh --bg-scale '$PWD/$WALLPAPER'\" > .fehbg"

cp -v .xinitrc .nanorc .fehbg  $BASE

mkdir -p $BASE.config/i3/
cp -v i3/* $BASE.config/i3

mkdir -p $BASE.config/termite/
cp /etc/xdg/termite/config ~/.config/termite/config

cp -v termite/config $BASE.config/termite
