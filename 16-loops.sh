#! /sbin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
START_TIME=$(date +%s)
END_TIME=$(date +%s)
sleep 5
echo "Sleeping for 5 sec"
TOTAL_TIME=$(($END_TIME - $START_TIME))

echo "Staring installation process $(date)"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p "$LOG_FOLDER"

if [ $USERID -ne 0 ]; then 
   echo -e "Install with $R ROOT user $N" | tee -a $LOG_FILE
   exit 1
fi

VALIDATION(){
if [ $1 -ne 0 ]; then 
   echo -e " $2 is $R FAILURE $N" | tee -a $LOG_FILE
else
   echo -e " $2 is $G SUCCESS $N" | tee -a $LOG_FILE
fi

}

for i in $@
do
    dnf list installed $i &>>$LOG_FILE
    if [ $? -ne 0 ]; then 
        dnf install $i -y &>>$LOG_FILE
        VALIDATION "$?" "$i"
    else
        echo -e " MYSQL Already installed :: $Y SKIPPING $N" | tee -a $LOG_FILE
    fi
done

echo "Total time excuted for installing services $TOTAL_TIME"
