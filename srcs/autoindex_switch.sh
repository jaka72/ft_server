#!/bin/bash
# from Hilmi​

# This is a script with which we can turn on or off the autoindex for nginx
​
SWITCH="$1" # apparently this is the first parameter when executing this script ???
​
if [[ $SWITCH == "on" ]]; then
    echo "Turn on the autoindex."
elif [[ $SWITCH == "off" ]]; then
    echo "Turn off the autoindex."
else
    echo "Invalid input. Run as: ./autoindex_switch.sh [on | off]"
    exit 1
fi
​
# Change the value inside the nginx.conf file
CONF_PATH="/etc/nginx/conf.d/"
grep -q "autoindex off;" ${CONF_PATH}nginx.conf             # Look for "autoindex off;" in nginx.conf
CURRENT="$?"                                                # 0 means off, 1 if on
if [[ $CURRENT == "0" ]] && [[ $SWITCH == "on" ]]; then
    sed -i 's/off;/on;/g' ${CONF_PATH}nginx.conf
    service nginx reload
elif [[ $CURRENT == "1" ]] && [[ $SWITCH == "off" ]]; then
    sed -i 's/on;/off;/g' ${CONF_PATH}nginx.conf
    service nginx reload
