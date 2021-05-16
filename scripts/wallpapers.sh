#!/bin/sh
# original author : F00b4rch
# descr : Make your wallpaper change on each start !
#
# Used to add random wallpaper to changer each time awesome starts.


# current awesome theme
THEME="wallpapers"
# Awesome conf path
AWPATH="$HOME/.config/awesome/theme/$THEME"
# image should have absolute path to image folder
IMAGE1=$(find $HOME/Pictures/Wallpapers/ -type f -name "*.png" -o -name "*.jpeg" -o -name "*.jpg"| shuf -n 1 | sed 's/\ /\\ /g')
IMAGE2=$(find $HOME/Pictures/Wallpapers/ -type f -name "*.png" -o -name "*.jpeg" -o -name "*.jpg"| shuf -n 1 | sed 's/\ /\\ /g')
IMAGE3=$(find $HOME/Pictures/Wallpapers/ -type f -name "*.png" -o -name "*.jpeg" -o -name "*.jpg"| shuf -n 1 | sed 's/\ /\\ /g')
IMAGE4=$(find $HOME/Pictures/Wallpapers/ -type f -name "*.png" -o -name "*.jpeg" -o -name "*.jpg"| shuf -n 1 | sed 's/\ /\\ /g')

cp -f $IMAGE1 $AWPATH/midnight-wallpaper.jpg
cp -f $IMAGE2 $AWPATH/morning-wallpaper.jpg
cp -f $IMAGE3 $AWPATH/noon-wallpaper.jpg
cp -f $IMAGE4 $AWPATH/night-wallpaper.jpg

