#!/bin/bash

# If user ID is 0, superuser; if not, not a superuser

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%s)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log

# Validation function
VALIDATE() {
  if [ $1 -ne 0 ]; then 
    echo "$2..... failure"
    exit 1
  else
    echo "$2......success"
  fi
}

# Check if the script is being run by root
if [ $USERID -eq 0 ]; then
  echo "You are running this script as root user."
else
  echo "Please run this script as root user."
  exit 1
fi

# Install MySQL and log output
dnf install mysql -y &>> $LOGFILE
VALIDATE $? "Installing MySQL"

# Install Git and log output
dnf install git -y &>> $LOGFILE
VALIDATE $? "Installing Git"
