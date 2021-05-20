#!/bin/bash
read n
curl https://raw.githubusercontent.com/elastic/examples/master/Common%20Data%20Formats/nginx_logs/nginx_logs -s  | awk -F" " '{print $9}'| grep $n | uniq -c | awk -F" " '{print $2" count is " $1}'
