#!/bin/bash

PAPE=$(ls $HOME/.config/papes | sort -R | head -1)

echo "Selected pape: $PAPE" 

feh --bg-scale $HOME/.config/papes/$PAPE
