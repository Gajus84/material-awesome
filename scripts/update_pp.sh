#!/bin/sh

echo "###############################################################################"
echo "###                             Update                                     ####"
echo "###############################################################################"

echo "Mirrors updaten?"
select yn in "Ja" "Nein"; do
    case $yn in
        Ja ) sudo reflector --verbose --download-timeout 40 --age 6 --latest 30  --fastest 30 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist; break;;
        Nein ) break;;
    esac
done

doas pacman -Sy && doas powerpill -Su && paru -Sua

read -n 1 -s -r -p $'Zum Beenden Taste drücken\n'

exit
