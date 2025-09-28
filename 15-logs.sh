#! /sbin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0| cut -d "." -f1 )
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOG_FOLDER
echo " Script started : $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then 
 echo "Install with root user" | tee -a $LOG_FILE
 exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then 
 echo -e " Failure Install of $2 is $R FAILURE $N" | tee -a $LOG_FILE
else
 echo -e " Success Install of $2 is  $G SUCCESS $N" | tee -a $LOG_FILE
fi
}

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE "$?" "MYSQL"
else 
    echo -e "Already installed : $Y SKIPPING $N" | tee -a $LOG_FILE
fi

dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ]; then 
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE "$?" "NGINX"
else 
    echo -e "Already installed : $Y SKIPPING $N" | tee -a $LOG_FILE
fi