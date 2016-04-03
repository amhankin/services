#!/bin/bash
#set -e
datetoday=`date '+%Y%m%d_%H%M%S'`
#echo $datetoday
exec > >(tee -i /srv/backup/logs/backup_${datetoday}.log)
exec 2>&1
if [ -x /srv/backup/backup.sh ]; then /srv/backup/backup.sh; fi
