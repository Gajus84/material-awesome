#!/bin/bash

echo "###############################################################################"
echo "###                             Speedtest                                  ####"
echo "###############################################################################"

speedtest-cli --secure

echo "Test wiederholen?"
select yn in "Ja" "Nein"; do
    case $yn in
        Ja ) speedtest-cli --secure; break;;
        Nein ) break;;
    esac
done

read -n 1 -s -r -p $'Zum Beenden Taste drücken\n'

exit
