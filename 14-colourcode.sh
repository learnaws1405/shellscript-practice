#! /sbin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "$G Hello world $N"

if [ $USERID -ne 0 ]; then 
   echo "Install with root user"
   exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
    echo -e "$R Error in installing $2 server $N"
    exit 1
else 
    echo -e "$G SUCESS in $2 server $N "
fi
}

dnf list installed mysqll
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE "$?" "MYSQL"
else
    echo -e "Already installed :: $Y SKIPPING $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then 
    dnf install nginx -y
    VALIDATE "$?" "NGINX"
else 
    echo -e "Already installed :: $Y SKIPPING $N"
fi

