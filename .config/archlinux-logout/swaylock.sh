#!/bin/bash

DIR=$HOME/.config/hypr/bg
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

swaylock --ignore-empty-password \
	--show-failed-attempts \
	--hide-keyboard-layout \
	--indicator-caps-lock \
	--clock --indicator --effect-blur 7x5 -i ${DIR}/${RANDOMPICS}
