#!/bin/bash
## authored by t0x1cbyt3 on Ubuntu 18.04.02 LTS
##

## Parse device value of Touchpad Input device
device=$(xinput|grep "06CB:CD65"|awk -F 'Touchpad' '{print $2}'|cut -f 2)
device=${device:3}

## Parse property value of "Disable while Typing"
prop=$(xinput list-props $device|grep "Disable While Typ"|head -n 1|awk -F '(' '{print $2}')
prop=${prop:0:3}

##
## Check if any input is given
## and if not, set to default 0
##
if [ $# -eq 1 ]
  then
		xinput --set-prop $device $prop $1
  else
  		echo 'Add a "1"  as an argument to enable "Disable Touchpad While Typing"'
		xinput --set-prop $device $prop 0
fi
exit 0
