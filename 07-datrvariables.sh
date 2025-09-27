#! /sbin/bash

STARTDATE=$(date +%s)
sleep 5
ENDDATE=$(date +%s)

TOTALTIME=$(($STARTDATE - $ENDDATE ))

echo "Total time to excute the script : $TOTALTIME"