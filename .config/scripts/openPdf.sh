#!/bin/bash

arguments="$*"
[ "${arguments:0:1}" == "/" ] || filename_prefix="$PWD"

exec osascript \
-e "tell application \"Skim\"" \
-e "open ((POSIX file \"$filename_prefix/$*\") as string)" \
-e "revert front document" \
-e "end tell";
