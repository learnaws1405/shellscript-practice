#! /sbin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]; then 
    echo "Run with root user"
    exit 1
fi

VALIDATE(){
  if [$1 -ne 0]; then 
    echo "FAILURE in $2 process"
    exit 1
   else
   echo "SUCCESS in $2 process" 
     
}

dnf install mysql -y 
VALIDATE "$?" "MYSQL"

dnf install ngnix -y 
VALIDATE "$?" "NGNIX"

dnf insall mongodv-mongosh -y
VALIDATE "$?" "MONGODB"
