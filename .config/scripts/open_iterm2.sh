#!/bin/bash
#simplified version of an open iterm scripts, requires iterm default window arrangement to be no windows
#and requires iterm to open said default arrangement on launch

exec osascript \
-e "if application \"iTerm\" is not running then" \
-e "activate application \"iTerm\"" \
-e "end if" \
-e "tell application \"iTerm\" to create window with default profile";
