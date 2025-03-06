#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then 
 echo "please run this script with root user"
  exit 1
else
  echo "you are a root user"
fi
VALIDATE(){
 if [ $1 -ne 0 ]   
  echo -e "$2 .... $R FAILURE $N"
 else
  echo -e "$2 ..... $RSUCCESS $N"
 fi
}

yum module disable nodejs -y &>>LOGFILE
VALIDATE $? "disabling default nodejs"

dnf module enable nodejs:20 -y &>>LOGFILE
VALIDATE $? "enabling nodejs new version:20"

dnf install nodejs -y &>>LOGFILE
VALIDATE $? "installing nodejs"

useradd expense
VALIDATE $? "creating user expense"





