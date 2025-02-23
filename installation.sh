#!/bin/bash


#if id is 0 super zero super user if not super user

USERID=$(id -u)

if [ $USERID -eq 0]
then 
 echo "you are a super user"
else 
 echo "please run this script by super user"
fi
yum install mysql -y