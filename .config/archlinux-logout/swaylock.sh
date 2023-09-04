#!/bin/bash

DIR=$HOME/.config/hypr/bg
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

swaylock --clock --indicator --effect-blur 7x5 -i ${DIR}/${RANDOMPICS}
