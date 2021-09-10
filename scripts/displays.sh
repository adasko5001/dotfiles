#!/bin/bash


# This script is used to change display outputs while docking/un-docking laptop.
# For now, there needs to be a small delay between changing displays, otherwise 
# it will not change displays properly (will show artifacts). It's due to cheap 
# USB-C dongle/docking station.


PRIMARY_DISPLAY="DisplayPort-3"
SECONDARY_DISPLAY="DisplayPort-2"
BUILT_IN_DISPLAY="eDP"

TIMEOUT=10s


dock() {
    echo "Enabling $PRIMARY_DISPLAY display..."
    xrandr --output $PRIMARY_DISPLAY --auto
    sleep $TIMEOUT

    echo "Disabling $BUILT_IN_DISPLAY display..."
    xrandr --output $BUILT_IN_DISPLAY --off
    sleep $TIMEOUT

    echo "Enabling $SECONDARY_DISPLAY display..."
    xrandr --output $SECONDARY_DISPLAY --auto --left-of $PRIMARY_DISPLAY

    echo "Finished docking..."
}

undock() {
    echo "Disabling $PRIMARY_DISPLAY display..."
    xrandr --output $PRIMARY_DISPLAY --off
    sleep $TIMEOUT

    echo "Disabling $SECONDARY_DISPLAY display..."
    xrandr --output $SECONDARY_DISPLAY --off
    sleep $TIMEOUT

    echo "Enabling $BUILT_IN_DISPLAY display..."
    xrandr --output $BUILT_IN_DISPLAY --auto

    echo "Finished un-docking..."
}


if [[ $1 == "DOCK" ]]; then
    dock
elif [[ $1 == "UNDOCK" ]]; then
    undock
else
    echo "Not supported action..."
fi
