#!/usr/bin/env sh
#Delay start of applications which depend on other apps to be started first (e.g. deamons). Helps with apps that don't spawn into to tray like they are supposed to.


function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}
sleep 20
run opensnitch-ui

