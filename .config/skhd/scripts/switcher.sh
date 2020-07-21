#!/usr/bin/env bash

CURRENT_CFG_NAME=$(head -1 ${SKHD_DIR}/skhdrc | cut -c2-)
NEW_CFG=$1

mv "${SKHD_DIR}/skhdrc" "${SKHD_DIR}/${CURRENT_CFG_NAME}"
mv "${SKHD_DIR}/$1" "${SKHD_DIR}/skhdrc"

osascript -e 'display notification "changed SKHD config to '"$(head -1 ${SKHD_DIR}/skhdrc | cut -c2-)"'" with title "SKHD config"' 




