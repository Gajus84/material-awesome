#!/usr/bin/env sh
#Delay start of applications which depend on other apps to be started first (e.g. deamons). Helps with apps that don't spawn into to tray like they are supposed to.


function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
sleep 10
st -c lfs1 -t LF -e lfrun &
st -c lfs2 -t LF -e lfrun &
#st -c joshuto -t Joshuto -e joshuto &
sleep 20
#run opensnitch-ui &
#sleep 5
#run /var/lib/portmaster/portmaster-start notifier --data=/var/lib/portmaster &
run kdeconnect-indicator &
#run indicator-kdeconnect &
