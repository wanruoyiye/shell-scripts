#!/bin/bash
#inotify+rsync shishitongbu

path=/data
backup_server=192.168.231.21

/usr/bin/inotifywait -mrq --format '%w%f' -e create,close_write,delete /data | while read line
do 
  if [ -f ${line} ];then
    rsync -az ${line} --delete rsync_backup@${backup_server}::backup --password-file=/etc/rsync.password
  else
     cd $path && \
     rsync -az ./ --delete rsync_backup@${backup_server}::backup --password-file=/etc/rsync.password
  fi
done
