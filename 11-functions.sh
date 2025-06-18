#!/bin/bash

#checking whether the user is root user or not

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: you must have root access to execute the script"
    exit 1
else 
    echo "you are root user.you have root access"

fi 

VALIDATE() {

if [ $1 -ne 0 ]
    then 
        echo "installing $2....FAILURE"
        exit 1
    else
        echo "Installing $2....SUCCESS"
    fi         

}

  dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed. so we are installing it now"

    dnf install mysql -y
    VALIDATE $? "MYSQL"
   
else 
    echo "mysql is already....INSTALLED"
fi        

 dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "nginx is not installed. so we are installing it now"

    dnf install nginx -y
    VALIDATE $? "nginx"

else 
    echo "nginx is already....INSTALLED"
fi        

 dnf list installed python3

if [ $? -ne 0 ]
then 
    echo "python3 is not installed. so we are installing it now"

    dnf install python3 -y
    VALIDATE $? "pyhon3"
             
else 
    echo "python3 is already....INSTALLED"
fi        

         