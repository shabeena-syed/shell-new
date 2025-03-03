#!/bin/bash


##it is a block of code we can pass the input from the functions

# variable is best practice
# block of code is passed by using the functions

USERID=$(id -u)
VALIDATE(){
   if [ $1 -ne 0 ]
   then
    echo "$2....FAILED"
    exit 1
   fi
}
   

if [ $USERID -ne 0 ]
then 
   echo" please run this script with root user"
   exit 1
else 
  echo "you are super user"
fi
yum install mysql -y
VALIDATE $? "installing mysql"
