#!/bin/bash

#checking whether the user is root user or not

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R Error: you must have root access to execute the script $N "
    exit 1
else 
    echo "you are root user.you have root access"

fi 

VALIDATE() {

if [ $1 -ne 0 ]
    then 
        echo -e "installing $2....$R FAILURE $N"
        exit 1
    else
        echo -e "Installing $2....$G SUCCESS $N "
    fi         

}

  dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed. so we are installing it now"

    dnf install mysql -y
    VALIDATE $? "MYSQL"
   
else 
    echo -e "mysql is $Y already....INSTALLED $N "
fi        

 dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed. so we are installing it now"

    dnf install nginx -y
    VALIDATE $? "nginx"

else 
    echo -e "nginx is $Y already....INSTALLED $N "
fi        

 dnf list installed python3

if [ $? -ne 0 ]
then 
    echo "python3 is not installed. so we are installing it now"

    dnf install python3 -y
    VALIDATE $? "pyhon3"
             
else 
    echo -e "python3 is $Y already....INSTALLED $N"
fi        

         