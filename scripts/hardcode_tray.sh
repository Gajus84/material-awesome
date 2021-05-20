#!/bin/sh

echo "###############################################################################"
echo "###                             Hardcode-Tray                                     ####"
echo "###############################################################################"

sudo hardcode-tray --theme Papirus-Dark

read -n 1 -s -r -p $'Zum Beenden Taste drücken\n'

exit
