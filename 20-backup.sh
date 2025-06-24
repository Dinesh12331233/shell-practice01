#!/bin/bash

USERID=$(id -u) 
SOURCE_DIR=$1 
DEST_DIR=$2 
DAYS=${3:-14} #isthe $3 loki value teeskuntundhi. ivvakapothe 14 days ani teeskuntundhi 

LOGS_FOLDER="/var/log/shellscript-logs" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m" 

check_root 
mkdir -p $LOGS_FOLDER  

USAGE(){
    echo -e "$R USAGE:: $N sh 20-backup.sh <source-dir> <dest-dir> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE
fi 













VALIDATE() {

if [ $1 -ne 0 ]
    then 
        echo -e "$2....$R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "$2....$G SUCCESS $N" | tee -a $LOG_FILE
    fi         
} 

#checking the user has root access or not
if [ $USERID -ne 0 ]
then
    echo -e "$R Error: you must have root access to execute the script $N " | tee -a $LOG_FILE
    exit 1
else 
    echo "you are root user.you have root access" | tee -a $LOG_FILE
fi