#!/bin/bash


#if id is 0 super zero super user if not super user

USERID=$(id -u)
validate(){
    echo "exit status:$?"
    echo "what are u doing:$1"
}

if [$USERID -eq 0]
dnf install mysql -y
validate $? installing mysql
dnf install git -y
validate $? installing git 
echo "is script proceeding?"