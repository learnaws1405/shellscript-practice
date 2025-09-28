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

dnf list installed mysql
if [ $? -ne 0 ]; then 
    dnf install mysql -y 
    VALIDATE "$?" "MYSQL"
else
    echo "Already mysql installed "
fi

dnf  list installed nginx
if [ $? -ne 0 ]; then 
    dnf install nginx -y 
    VALIDATE "$?" "NGNIX"
else 
    ech0 "Already NGNIX installed"
fi
# dnf install python3 -y
# VALIDATE "$?" "python3"
