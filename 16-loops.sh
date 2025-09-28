#! /sbin/bash


USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOG_FOLDER="/var/log/shell-script"
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)"
LOG_FILE="$LOG_FOLDER/$SCRIPT_NAME.log"
mkdir -p "$LOG_FOLDER"

if [ $USERID -ne 0 ]; then 
   echo -e "Install with $R ROOT user $N"
   exit 1
fi

VALIDATION(){
if [$1 -ne 0 ]; then 
   echo -e " $2 is $R FAILURE $N"
else
   echo -e " $2 is $G SUCCESS $N"
fi

}

for i in install "$@"
do
    dnf list installed $i
    if [ $? -ne 0 ]; then 
        dnf install $i -y
        VALIDATION "$?" "MYSQL"
    else
        echo -e " MYSQL Already installed :: $Y SKIPPING $N"
    fi
done

