#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #In projects it will be 75% 
MSG=""
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

while IFS= read LINE 
do 
    USAGE=$(echo $LINE | awk '{print $6F}' | cut -d "%" -f1) 
    LOCATION=$(echo $LINE | awk '{print $7F}') 
    #echo "$LOCATION: $USAGE%" 

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        MSG+="HIGH Disk Usage on $LOCATION: $USAGE% <br>" 
    fi     

done <<< $DISK_USAGE 

#echo -e $MSG 


sh mail.sh "DevOps Team" "High Disk Usage" "$IP" "$MSG" "dineshkancherla7@gmail.com" "Alert-High Disk Usage"
