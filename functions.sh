#!/bin/bash


##it is a block of code we can pass the input from the functions

# variable is best practice
# block of code is passed by using the functions

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"

echo "script started executing  at:$TIMESTAMP"

VALIDATE(){
   if [ $1 -ne 0 ]
   then
    echo -e "$2....$R FAILED $N"
    exit 1
    else
    echo -e "$2....$G SUCEESS $N"
   fi
}
   

if [ $USERID -ne 0 ]
then 
   echo" please run this script with root user"
   exit 1
else 
  echo "you are super user"
fi
yum install mysqld -y &>>$LOGFILE
VALIDATE $? "installing mysql"
