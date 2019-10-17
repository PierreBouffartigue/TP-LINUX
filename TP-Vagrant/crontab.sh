#!/bin/bash

cron="/5 * * * * rsync --partial --progress --rsh=ssh /var/www/html/data vagrant@192.168.96.10:/var/www/html"
cron_escaped=$(echo "$cron" | sed s/\*/\\\\*/g)

crontab -l | grep "${cron_escaped}"
if [[ $? -eq 0 ]] ;
  then
    echo "The crontab already exists"
    exit
  else
    crontab -l > mycron
    echo "$cron" >> mycron
    crontab mycron
    rm mycron
fi
