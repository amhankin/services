#!/bin/bash
set -x
DATESTAMP=`date "+%Y%m%d_%H%M%S"`
exec > >(tee -i /srv/sync/logs/test1_${DATESTAMP}.log)
exec 2>&1
NAME='presentations_remote'
TARGET="/nist/Data_AlCa/PapersPresentations/"
SOURCE="/Users/amh4/Research/PapersPresentations/"
LOGFILE_LOCAL="/srv/sync/logs/rsynclog_local_${NAME}_${DATESTAMP}"
LOGFILE_REMOTE="/srv/sync/logs/rsynclog_remote_${NAME}_${DATESTAMP}"

# Sync files from server to local direcotry
echo
echo "---------------------------------------------------------------"
echo "Syncing ${SOURCE} to ${TARGET}"
echo "See ${LOGFILE_LOCAL} for details"
/srv/sync/sync.sh "${SOURCE}" "${TARGET}" "${LOGFILE_LOCAL}"
echo "---------------------------------------------------------------"
echo

# Sync files to server from local directory
echo "---------------------------------------------------------------"
echo "Syncing ${TARGET} to ${SOURCE}"
echo "See ${LOGFILE_REMOTE} for details"
/srv/sync/sync.sh "${TARGET}" "${SOURCE}" "${LOGFILE_REMOTE}"
echo "---------------------------------------------------------------"
echo
