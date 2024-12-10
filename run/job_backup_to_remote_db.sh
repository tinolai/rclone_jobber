#!/usr/bin/env sh

################################### license ##################################
# job_backup_to_remote.sh calls rclone_jobber to perform a backup to remote.
# Written in 2018 by Wolfram Volpi, contact at https://github.com/wolfv6/rclone_jobber/issues.
# To the extent possible under law, the author(s) have dedicated all copyright and related and neighboring rights to this software to the public domain worldwide.
# This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along with this software. If not, see http://creativecommons.org/publicdomain/zero/1.0/.
# rclone_jobber is not affiliated with rclone.
##############################################################################

#this script uses these user-defined environment variables: rclone_jobber, remote
rclone_jobber="/opt/rclone_jobber" #path to rclone_jobber directory

source="/xxx/database"
dest="Backup:bkln-server/xxx"
move_old_files_to="dated_files"
#options="--filter-from=$rclone_jobber/examples/filter_rules -P"
options="--filter-from=$rclone_jobber/run/filter_rules.db"
#options="-P"
monitoring_URL=""

$rclone_jobber/rclone_jobber.sh "$source" "$dest" "$move_old_files_to" "$options" "$(basename $0)" "$monitoring_URL"
#echo $rclone_jobber/rclone_jobber.sh "$source" "$dest" "$options" "$(basename $0)" "$monitoring_URL"

#display test directories (display for tutorial only, don't do this in production)
#tree -a $source
#rclone ls $dest
