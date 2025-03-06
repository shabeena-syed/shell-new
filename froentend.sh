USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"

if [ $USERID -ne 0 ]
then 
 echo "please run the script by a super user"
 Exit 1
else
 echo " u are a super user"
fi

VALIDATE (){
    if [ $1 -ne 0 ]
    then
      echo "$1 is ....FAILURE"
    else
      echo "$2 is ..... SUCCESS"
    fi
}  

dnf install nginx -y &>>LOGFILE
VALIDATE $? " installing nginx"

systemctl enable nginx &>>LOGFILE
VALIDATE $? "enabling nginx"

systemctl start nginx &>>LOGFILE
VALIDATE $? "starting nginx"

rm -rf /usr/share/nginx/html/* &>>LOGFILE
VALIDATE $? "removing the default content"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
VALIDATE $? "downloading new code"

cd /usr/share/nginx/html 
unzip /tmp/frontend.zip
VALIDATE $? "unzip the code"

cp /home/ec2-user/shell-new/expense.conf etc/nginx/default.d/expene.conf &>>LOGFILE
VALIDATE $? "copied expense conf"

systemctl restart nginx &>>LOGFILE
VALIDATE $? "restart nginx"






