#!/bin/bash
datestamp=`date "+%Y%m%d_%H%M%S"`
logfile="/srv/sync/logs/rsynclog_local_${datestamp}"
SOURCE="/nist/Data_AlCa/"
TARGET="/Volumes/WD01_STORAGE/Data_AlCa/"

## Sync SOURCE to local drive 
# 	Useful debuggin options:
#	--progress: print all files synced to standard output
#  	--dry-run: change no files

rsync --exclude-from=/srv/sync/rsync_excludes \
	--archive \
	--links \
	--log-file=$logfile \
	${SOURCE} \
	${TARGET}
