#!/bin/bash

#checking whether the user is root user or not

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd" "git" "gcc")

mkdir -p $LOGS_FOLDER

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

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
        echo -e "installing $2....$R FAILURE $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Installing $2....$G SUCCESS $N" | tee -a $LOG_FILE
    fi         

}

for package in ${PACKAGES[@]}
do
    dnf list installed $package &>>$LOG_FILE

if [ $? -ne 0 ]
then 
    echo "$package is not installed. so we are installing it now" | tee -a $LOG_FILE

    dnf install $package -y &>>$LOG_FILE
    VALIDATE $? "$package"
   
else 
    echo -e "$package is $Y already....INSTALLED $N" | tee -a $LOG_FILE
fi
done

 
         