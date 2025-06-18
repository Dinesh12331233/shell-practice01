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

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "mysql is not installed. so we are installing it now"

    dnf install mysql -y

    if [ $? -ne 0 ]
    then 
        echo "installing mysql....FAILURE"
        exit 1
    else
        echo "Installing mysql....SUCCESS"
    fi         
else 
    echo "mysql is already....INSTALLED"
fi        

         