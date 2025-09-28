#! /sbin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then 
 echo "Install with root user"
 exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
 echo " $R Failure Install of $2 is FAILURE $N"
else
 echo "$G Success Install of $2 is  SUCCESS $N"
fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE "$?" "MYSQL"
else 
    echo "Already installed : $Y SKIPPING $N"
fi

dnf install nginx -y
if [ $? -ne 0 ]; then 
    dnf install mysql -y
    VALIDATE "$?" "NGINX"
else 
    echo "Already installed : $Y SKIPPING $N"
fi