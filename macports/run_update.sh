#!/bin/bash
#set -x
TODAY=`date '+%Y%m%d_%H%M%S'`
LOGPATH='/srv/macports/logs'
SCRIPTPATH='/srv/macports'
SCRIPTNAME='update.sh'
#echo $datetoday
exec > >(tee -i ${LOGPATH}/macports_update_${TODAY}.log)
exec 2>&1
if [ -x ${SCRIPTPATH}/${SCRIPTNAME} ]; then ${SCRIPTPATH}/${SCRIPTNAME}; fi
