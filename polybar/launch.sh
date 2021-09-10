#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Get proper ethernet interface (USB-C dongle/docking station has it's own 
# interface, use it in polybar instead of built-in one in laptop...
export NETWORK_INTERFACE

NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)
echo $NETWORK_INTERFACE

# Depending on passed parameter, launched proper polybars...
if [[ $1 == 'WORK' ]]; then
    polybar -r MAIN_WORK_DISPLAY &
    polybar -r SECONDARY_WORK_DISPLAY &
elif [[ $1 == 'HOME' ]]; then
    polybar -r eDP &
elif [[ $1 == 'DOCK' ]]; then
    polybar -r MAIN_DOCK_DISPLAY &
    polybar -r SECONDARY_DOCK_DISPLAY &
else
    echo "Parameter not supported..."
fi
