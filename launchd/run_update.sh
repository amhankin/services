#!/bin/bash
#set -e
TODAY=`date '+%Y%m%d_%H%M%S'`
LOGPATH='/srv/launchd/logs'
SCRIPTPATH='/srv/launchd'
SCRIPTNAME='update.sh'
#echo $datetoday
exec > >(tee -i ${LOGPATH}/backup_${TODAY}.log)
exec 2>&1
if [ -x ${SCRIPTPATH}/${SCRIPTNAME} ]; then ${SCRIPTPATH}/${SCRIPTNAME}; fi
