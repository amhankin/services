#!/bin/bash
NAME='PaperPresentations'
DATESTAMP=`date "+%Y%m%d_%H%M%S"`
SOURCE="/Volumes/WD01_STORAGE/Data_AlCa/PapersPresentations/"
TARGET="/nist/Data_AlCa/PapersPresentations/"
LOGFILE="/srv/sync/logs/rsynclog_remote_${NAME}_${DATESTAMP}"

echo
echo "Syncing ${SOURCE} to ${TARGET}"
echo "\tSee ${LOGFILE} for details"
/srv/sync/sync.sh "${SOURCE}" "${TARGET}" "${LOGFILE}"
