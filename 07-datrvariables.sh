#! /sbin/bash

STARTDATE=$(date +%s)
sleep 5
ENDDATE=$(date +%s)

TOTALTIME=$(($ENDDATE - $STARTDATE ))

echo "Total time to excute the script : $TOTALTIME"