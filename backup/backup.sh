#!/bin/bash

#set -x 		# uncomment to see verbose output
ulimit -n 1024 	# required for macs for some reason

# Retrieve configuration settings from config file
BACKUP=`awk '$1 == "backup:" {print $2}' config`
PASSPHRASE=`awk '$1 == "passphrase:" {print $2}' config`
TARGET=`awk '$1 == "target:" {print $2}' config`
EXCLUDE=`awk '$1 == "exclude:" {print $2}' config`
INCLUDE=`awk '$1 == "include:" {print $2}' config`
SOURCE=`awk '$1 == "source:" {print $2}' config`
OLDAGE="30D"
FULLAGE="20D"

date

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
