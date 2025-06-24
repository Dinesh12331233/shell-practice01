#!/bin/bash 

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs" 
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR="/home/ec2-user/app-logs" 

#checking the user has root access or not
if [ $USERID -ne 0 ]
then
    echo -e "$R Error: you must have root access to execute the script $N " | tee -a $LOG_FILE
    exit 1
else 
    echo "you are root user.you have root access" | tee -a $LOG_FILE
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

mkdir -p $LOGS_FOLDER 

echo "script started executing at $(date)" | tee -a $LOG_FILE

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14) 

while IFS= read -r filepath
do 

    echo "deleting file: $filepath" | tee -a $LOG_FILE 
     rm -rf $filepath 

done <<< $FILES_TO_DELETE #file ite done < filename ani istam
                          #script lo nunchi vachina output ite <<< ila ivvali 

echo "script executed successfully" 