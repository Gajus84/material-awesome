#!/bin/bash
## Close WIndows after Autostart via WMCTRL
sleep 8
WD=(
    Tutanota
    )

for wd in "${WD[@]}"
do
wmctrl -c $wd
done
