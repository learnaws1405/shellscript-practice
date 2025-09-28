#! /sbin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

mkdir -p $LOG_FOLDER
LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0| cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"


echo " Script started : $(date)"

if [ $USERID -ne 0 ]; then 
 echo "Install with root user"
 exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
 echo -e " $R Failure Install of $2 is FAILURE $N"
else
 echo -e "$G Success Install of $2 is  SUCCESS $N"
fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE "$?" "MYSQL"
else 
    echo -e "Already installed : $Y SKIPPING $N"
fi

dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE "$?" "NGINX"
else 
    echo -e "Already installed : $Y SKIPPING $N"
fi