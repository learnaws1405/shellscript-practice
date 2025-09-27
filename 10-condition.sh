#! /sbin/bash

NUMBER=$1

if [ $NUMBER -lt 10 ]; then 
  echo "Given number is $NUMBER is less than 10"
elif [ $NUMBER -eq 10 ];then
  echo "Given number is $NUMBER is equal to  10"
else 
  echo "Given number is $NUMBER is greater than 10"
fi
  