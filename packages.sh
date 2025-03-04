#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%M-%S)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
VALIDATE() {
  if [ $1 -ne 0 ]; then 
    echo "$2..... failure"
    exit 1
  else
    echo "$2......success"
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
    echo "$i already installed...skipping"
  else
    echo "$i not installed.. need to install"
  fi
done