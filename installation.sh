#!/bin/bash


#if id is 0 super zero super user if not super user

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
VALIDATE(){
  if [ $1 -ne 0 ]
  then 
    echo "$2..... failure"
    exit 1
  else
    echo "$2......success"
  fi
}

if [ $USERID -eq 0 ]
then
 echo"please run this script with root user"
else
 echo "you are super user"
fi

dnf install mysql -y &>>$LOGFILE

VALIDATE $? "installing mysql"
dnf install git -y &>>$LOGFILE
VALIDATE $? "installing git" 

