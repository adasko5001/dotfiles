#!/bin/bash

dock() {
    # Enable proper displays
    $HOME/.config/scripts/displays.sh "DOCK"
    
    # Re-launch polybar
    $HOME/.config/polybar/launch.sh "DOCK"

    # Move i3 workspaces to proper screen
    python $HOME/.config/scripts/i3_switch_workspaces.py

    # Re-apply wallpaper
    $HOME/.config/scripts/papes.sh
}

undock () {
    # Enable proper displays
    $HOME/.config/scripts/displays.sh "UNDOCK"
    
    # Re-launch polybar
    $HOME/.config/polybar/launch.sh "HOME"

    # Re-apply wallpaper
    $HOME/.config/scripts/papes.sh
}


if [[ $1 == "DOCK" ]]; then
    dock 
elif [[ $1 == "UNDOCK" ]]; then
    undock
else
    echo "Not supported action..."
fi