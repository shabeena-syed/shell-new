#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then
  echo "you are not a super user"
  exit 1
else
  echo "u are a super user"
fi

echo "all packages: $@"