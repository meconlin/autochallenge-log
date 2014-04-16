#!/bin/sh

count_1=`grep "/production/file_metadata/modules/ssh/sshd_config" puppet_access_ssl.log | wc -l`
count_2=`grep "/production/file_metadata/modules/ssh/sshd_config" puppet_access_ssl.log | cut -d'"' -f2,3 | awk '$4!=200' | wc -l`
count_3=`cut -d'"' -f2,3 puppet_access_ssl.log | awk '$4!=200'  | wc -l`
count_4=`grep "PUT /dev/report" puppet_access_ssl.log | wc -l`
count_5=`grep "PUT /dev/report" puppet_access_ssl.log | awk '{split($0,array," ")} {print array[1]}' | uniq -c`

echo 'How often does sshd_config url show up        : '$count_1
echo '  How often was that request not a 200        : '$count_2
echo 'Total non 200 apache code returns             : '$count_3
echo 'PUT request sent to /dev/report               : '$count_4
echo "  Distinct ips and counts that sent PUTs      : \n$count_5"