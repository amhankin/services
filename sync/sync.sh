#!/bin/bash
SOURCE=$1
TARGET=$2
LOGFILE=$3

## Sync SOURCE to local drive 
# 	Useful debuggin options:
#	--progress: print all files synced to standard output
#  	--dry-run: change no files

rsync \
	--itemize-changes \
	--exclude-from="/srv/sync/rsync_excludes" \
	--archive \
	--update \
	--no-o \
	--no-g \
	--links \
	--human-readable \
	--log-file=${LOGFILE} \
	${SOURCE} \
	${TARGET}
