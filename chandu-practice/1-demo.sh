#!/bin/bash
** shebang **
echo "current user : $USER"
if [ "$USER" == "ec2-user"];
then
 echo "you are normal user"
else
 echo "you are root"

fi
sudo su yum install nginx -y
name=chandu
adduser "$name"
passwd "$name"
print -s "$passwd" 

