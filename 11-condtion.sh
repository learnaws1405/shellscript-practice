#! /sbin/bash

$NUMBER=$1

if [ $(($NUMBER % 2 )) -eq 0  ]; then 
    echo "Given number is even number"
else
    echo "Number is odd"
fi