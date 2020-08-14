#!/bin/bash

echo "" > /var/log/nginx/access.log
echo "" > /var/log/nginx/error.log
echo "-------------------"
rm -rf /var/log/nginx/access.log-20*.gz
rm -rf /var/log/nginx/error.log-20*.gz
