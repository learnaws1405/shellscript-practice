#! /sbin/bash

STARTDATE=$(date +%s)
ENDDATE=$(date +%s)

TOTALTIME=$(($STARTDATE - $ENDDATE ))

echo "Total time to excute the script : $TOTALTIME"