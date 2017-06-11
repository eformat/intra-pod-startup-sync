#!/bin/sh

DATA=/usr/share/nginx/html/data

while [ ! -d ${DATA} ]; do
    echo "waiting for ${DATA}"
    sleep 2
done
echo "found ${DATA}"

exec nginx -c /nginx.conf -g "daemon off;"
