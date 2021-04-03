#!/bin/bash

THE_PATH="/etc/nginx/sites-available/my_nginx.conf"
grep -q "autoindex on;" $THE_PATH
CURRENT="$?"      # if found, it returns  0, else 1

if [ $CURRENT == "0" ]; then
        echo "Autoindex is ON, will be turned OFF"
        sed -i 's/on;/off;/g' $THE_PATH
        service nginx reload
elif [ $CURRENT == "1" ]; then
        echo "Autoindex is OFF, will be turned ON"
        sed -i 's/off;/on;/g' $THE_PATH
        service nginx reload
fi