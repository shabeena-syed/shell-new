#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[35m"
N="\e[0m"
VALIDATE() {
  if [ $1 -ne 0 ]; then 
    echo -e "$2..... $R failure $N"
    exit 1
  else
    echo "$2......$G success $N"
  fi
}

if [ $USERID -ne 0 ]
then
  echo "you are not a super user"
  exit 1
else
  echo "u are a super user"
fi

for i in $@
do
  echo "package to install: $i"
  yum list installed $i &>>$LOGFILE
  if [ $? -eq 0 ]
  then
    echo -e "$i already installed...$R skipping $N"
  else
    dnf install $i -y &>>$LOGFILE
    VALIDATE $? "instaling $i"
  fi
done