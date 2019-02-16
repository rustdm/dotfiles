#!/bin/bash

PACKAGE_LIST = "xorg-server xorg-xinit i3-gaps i3-status dmenu NetworkManager termite ranger noto-fonts-extra noto-fonts-emoji feh firefox"

sudo yes | pacman -Syu
sudo yes | pacman -S "$PACKAGE_LIST"

wallpaper = "paul-earle-39322-unsplash.jpg"

echo "feh --bg-scale '$PWD$wallpaper'" > .fehbg 

cp -v .xinitrc /root/
cp -v .fehbg   /root/

cd i3
cp -v config /root/.config/i3/

cd ..
cd termite
cp -v config /root/.config/termite
