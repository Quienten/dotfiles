#!/bin/bash
EXTERNAL_OUTPUT="HDMI-2"
INTERNAL_OUTPUT="eDP-1"

# if we don't have a file, start at zero
if [ ! -f "/tmp/monitor_mode.dat" ] ; then
  monitor_mode="all"

# otherwise read the value from the file
else
  monitor_mode=`cat /tmp/monitor_mode.dat`
fi

if [ $monitor_mode = "all" ]; then
        notify-send "Monitor Mode" "Switching to external monitor only"
        monitor_mode="EXTERNAL"
        xrandr --output $INTERNAL_OUTPUT --off --output $EXTERNAL_OUTPUT --auto
elif [ $monitor_mode = "EXTERNAL" ]; then
        notify-send "Monitor Mode" "Switching to internal monitor only"
        monitor_mode="INTERNAL"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --off
elif [ $monitor_mode = "INTERNAL" ]; then
        notify-send "Monitor Mode" "Switching to both monitors"
        monitor_mode="CLONES"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --same-as $INTERNAL_OUTPUT
else
        notify-send "Monitor Mode" "Switching to extended monitors"
        monitor_mode="all"
        xrandr --output $INTERNAL_OUTPUT --auto --output $EXTERNAL_OUTPUT --auto --left-of $INTERNAL_OUTPUT
fi
echo "${monitor_mode}" > /tmp/monitor_mode.dat