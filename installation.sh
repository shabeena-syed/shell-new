#!/bin/bash


#if id is 0 super zero super user if not super user

USERID=$(id -u)

if [$USERID -eq 0]
then 
 echo "you are a super user"
fi 
dnf install mysql -y
if [ $? -ne 0 ]
then
 echo "installation of mysql is.... failure"
 exit 1
fi
dnf install git -y
if [ $? -ne 0 ]
 echo " installation of git ....failure"
 exit 1
fi 
echo "is script proceeding?"