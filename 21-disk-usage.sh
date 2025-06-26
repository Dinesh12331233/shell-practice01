#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #In projects it will be 75% 
MSG=""


while IFS= read LINE 
do 
    USAGE=$(echo $LINE | awk '{print $6F}' | cut -d "%" -f1) 
    LOCATION=$(echo $LINE | awk '{print $7F}') 
    #echo "$LOCATION: $USAGE%" 

    if [ $USAGE -ge $DISK_THRESHOLD ]
    then 
        MSG+="HIGH Disk Usage on $LOCATION: $USAGE%" 
    fi     

done <<< $DISK_USAGE 

echo -e $MSG