#!/bin/bash

#checking whether the user is root user or not

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error: you must have root access to execute the script"
    
else 
    echo "you are root user.you have root access"

fi 

dnf install mysql -y