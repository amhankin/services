#!/bin/bash

#set -x 		# uncomment to see verbose output
ulimit -n 1024 	# required for macs for some reason

# Retrieve configuration settings from config file
CONFIG="/srv/backup/config"
BACKUP=`awk '$1 == "backup:" {print $2}' $CONFIG`
PASSPHRASE=`awk '$1 == "passphrase:" {print $2}' $CONFIG`
TARGET=`awk '$1 == "target:" {print $2}' $CONFIG`
EXCLUDE=`awk '$1 == "exclude:" {print $2}' $CONFIG`
INCLUDE=`awk '$1 == "include:" {print $2}' $CONFIG`
SOURCE=`awk '$1 == "source:" {print $2}' $CONFIG`
OLDAGE="40D"
FULLAGE="30D"

date
cd /backup/ronjoe
cd ~/

# Perform backup
export PASSPHRASE
duplicity incremental \
	--full-if-older-than $FULLAGE \
	--verbosity 4 --exclude-device-files \
	--archive-dir "${BACKUP}/cache" \
	--exclude-filelist "$BACKUP/${EXCLUDE}" \
	--include-filelist "$BACKUP/${INCLUDE}" \
	--exclude '**' "$SOURCE" "$TARGET"
duplicity remove-older-than $OLDAGE --archive-dir "${BACKUP}/cache" --force "$TARGET"
duplicity cleanup --extra-clean --force --archive-dir "${BACKUP}/cache" "$TARGET"
duplicity collection-status --archive-dir "${BACKUP}/cache" "$TARGET"
unset PASSPHRASE
