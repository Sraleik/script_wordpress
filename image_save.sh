#!/bin/bash

date=`date +"%d-%m-%Y-%T"`

cd /var/www/script_server/sing-sing-bis/wp-content

filename=uploads_${date}

zip -r /media/Elements/image_backup/$filename uploads

