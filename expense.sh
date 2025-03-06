#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
echo "please enter DB password:"
read -s mysql_root_password

if [ $1 -ne 0]
then
  echo -e " installing mysql is .... .$R FAILURE $N"

if [ $USERID -ne 0 ]
then 
  echo "please run this script with root user"
  exit 1
else
  echo "you are a root user"
fi

yum install mysql-server -y &>>$LOGFILE
VALIDATE $? "installing MYSQL server"

systemctl enable mysqld &>>$LOGFILE
VALIDATE $? "enabling MYSQL server"

# mysql_secure_installation --set-root-pass ExpenseApp@1 &>>$LOGFILE
# VALIDATE $? "setting up root password"
mysql -h techzena.com -uroot -p${mysql_root_password} -e 'show databases;' &>>$LOGFILE
if [ $? -ne 0 ]
then
"mysql_secure_installation --set-root-pass ${mysql_root_password}  &>>$LOGFILE"
else
  echo "MYSQL Root password is already setup....$Y SKIPPING $N"
fi
