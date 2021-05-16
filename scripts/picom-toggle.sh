#!/bin/sh
# #Arco-Linux Picom-Restart-Script

if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom -b --config ~/.config/awesome/configuration/picom.conf
fi
