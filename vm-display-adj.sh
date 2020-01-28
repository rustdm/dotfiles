#!/bin/bash

#run cvt or gtf to get Modeline for the resolution we want
cvt 1440 900

#
xrandr --newmode "1440x900_60.00" 106.50  1440 1528 1672 1904  900 903 909 934 -hsync +vsync

xrandr --addmode Virtual-1 1440x900_60.00

xrandr --output Virtual-1 --mode 1440x900_60.00


mv 10-monitor.conf /etc/X11/xorg.conf.d/
