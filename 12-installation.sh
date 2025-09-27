#! /sbin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR in installating , please install with root user"
fi

dnf install mysql -y

if [ "$?" -ne 0 ]; then 
    echo "ERROR installing Mysql client"
else
    echo "Installtion is SUCCESS"
fi