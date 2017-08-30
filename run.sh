#!/bin/bash

set -e
set -o pipefail

#SOURCE="/app"
#TARGET="/data"
#SETTINGS_FILE="Settings.config"

#if [ ! -f "$TARGET/$SETTINGS_FILE" ]; then
#	echo "Fresh install detected, applying default configuration.."
#	cp -f $SOURCE/$SETTINGS_FILE $TARGET/$SETTINGS_FILE
#	rm -f $SOURCE/$SETTINGS_FILE
#fi

#ln -sf $TARGET/$SETTINGS_FILE $SOURCE/$SETTINGS_FILE

#nginx

exec mono /app/bin/Klondike.SelfHost.exe --interactive --port=8080 &

nginx -g 'daemon off;'
