#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #In projects it will be 75% 



while IFS= read LINE 
do 
    USAGE=$(echo $LINE | awk '{print $6F}' | cut -d "%" -f1) 
    LOCATION=$(echo $LINE | awk '{print $7F}') 
    echo "$LOCATION: $USAGE" 

done <<< $DISK_USAGE 