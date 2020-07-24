#!/usr/bin/env bash

CURRENT_CFG_NAME=$(head -1 ${SKHD_DIR}/skhdrc | cut -c2-)
NEW_CFG=$1

if [ -f "${SKHD_DIR}/$1" ]; then
	if [[ -f "${SKHD_DIR}/${CURRENT_CFG_NAME}" && "${SKHD_PROFILE_OVERWRITE}" == false ]]; then
		osascript -e 'display notification "the config save '"${CURRENT_CFG_NAME}"' already exists. No changes were made." with title "SKHD config"'
	else
		mv "${SKHD_DIR}/skhdrc" "${SKHD_DIR}/${CURRENT_CFG_NAME}"
		mv "${SKHD_DIR}/$1" "${SKHD_DIR}/skhdrc"
	osascript -e 'display notification "changed SKHD config to '"$(head -1 ${SKHD_DIR}/skhdrc | cut -c2-)"'." with title "SKHD config"' 
	fi
else
	osascript -e 'display notification "no such config '"$1"'." with title "SKHD config"'
fi



