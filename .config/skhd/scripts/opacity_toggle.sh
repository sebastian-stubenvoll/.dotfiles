#!/usr/bin/env bash

#grab workspace layout
window_opacity_var=$(yabai -m config normal_window_opacity)
let max=1

#change layout based on current layout
if (( $(echo "$window_opacity_var < $max" |bc -l) ))  ; then
    yabai -m config normal_window_opacity 1.00
    osascript -e 'display notification "disabled opacity for out-of-focus windows" with title "yabai layout"'
else
  yabai -m config normal_window_opacity 0.85 
    osascript -e 'display notification "enabled opacity for out-of-focus windows" with title "yabai layout"'
fi
