#!/bin/bash

set -e
set -o pipefail

# Fix permissions
chown -R klondike:klondike /data

#SOURCE="/app"
#TARGET="/data"
#SETTINGS_FILE="Settings.config"

#if [ ! -f "$TARGET/$SETTINGS_FILE" ]; then
#	echo "Fresh install detected, applying default configuration.."
#	cp -f $SOURCE/$SETTINGS_FILE $TARGET/$SETTINGS_FILE
#	rm -f $SOURCE/$SETTINGS_FILE
#fi

# Update the symlink
#ln -sf $TARGET/$SETTINGS_FILE $SOURCE/$SETTINGS_FILE

# Start nginx
nginx

# Setup FIFO (fixes stdin issues with Klondike's interactive mode)
fifo=$PWD/fifo.tmp
mkfifo $fifo
exec 3<> $fifo
rm -f $fifo

# Run Klondike as the 'klondike' user
su klondike -c "mono /app/bin/Klondike.SelfHost.exe --interactive --port=8080 <&3"
