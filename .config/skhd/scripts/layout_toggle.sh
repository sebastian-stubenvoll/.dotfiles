#!/usr/bin/env bash

#grab workspace layout
index=$(yabai -m query --spaces --space | jq -r '.index|tostring')
layout=$(yabai -m query --spaces --space | jq -r .type)

#change layout based on current layout
if [ "$layout" == "bsp" ]; then
    yabai -m space --layout float
    osascript -e 'display notification "changed space '"$index"' layout to floating" with title "yabai layout"'
else
    yabai -m space --layout bsp
    osascript -e 'display notification "changed space '"$index"' layout to bsp" with title "yabai layout"'
fi
