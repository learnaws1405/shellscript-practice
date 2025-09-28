#! /sbin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then 
    echo "Run with root user"
    exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
    echo "FAILURE in $2 process"
    exit 1
else
   echo "SUCCESS in $2 process" 
fi     
}

dnf install mysqls -y 
VALIDATE "$?" "MYSQL"

dnf install nginx -y 
VALIDATE "$?" "NGNIX"

dnf insall mongodb-mongoshx -y
VALIDATE "$?" "MONGODB"
