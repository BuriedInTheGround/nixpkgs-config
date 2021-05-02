#!/usr/bin/env bash

while true; do
    status=$(cat ~/.auto-toggle-polybar | head -n 1)

    if [[ $status == "" ]]; then
        if [[ $(bspc query -N -n focused.fullscreen) != "" ]]; then
            polybar-msg cmd hide
            bspc config top_padding 0
            echo "auto-hidden" > ~/.auto-toggle-polybar
        fi
    fi

    if [[ $status == "auto-hidden" ]]; then
        if [[ $(bspc query -N -n focused.fullscreen) == "" ]]; then
            polybar-msg cmd show
            bspc config top_padding 32
            echo "" > ~/.auto-toggle-polybar
        fi
    fi

    sleep 0.5
done
