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

  dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then 
    echo "mysql is not installed. so we are installing it now" | tee -a $LOG_FILE

    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "MYSQL"
   
else 
    echo -e "mysql is $Y already....INSTALLED $N" | tee -a $LOG_FILE
fi        

 dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then 
    echo "nginx is not installed. so we are installing it now" | tee -a $LOG_FILE

    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"

else 
    echo -e "nginx is $Y already....INSTALLED $N " | tee -a $LOG_FILE
fi        

 dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then 
    echo "python3 is not installed. so we are installing it now" | tee -a $LOG_FILE

    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "pyhon3"
             
else 
    echo -e "python3 is $Y already....INSTALLED $N " | tee -a $LOG_FILE
fi        

         