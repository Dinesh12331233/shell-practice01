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

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installing mysql....FAILURE"
    exit 1
else
    echo "Installing mysql....SUCCESS"
fi         