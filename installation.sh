#!/bin/bash


#if id is 0 super zero super user if not super user

USERID=$(id -u)
VALIDATE(){
 echo "exit status: $1"
 echo "what are u doing: $2"
}

if [ $USERID -eq 0 ]
then
 echo"please run this script with root user"
else
 echo "you are super user"
fi

dnf install mysql -y
VALIDATE $? "installing mysql"
dnf install git -y
VALIDATE $? "installing git" 

