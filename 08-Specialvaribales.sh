#! /sbin/bash

echo "All variables/arguments are passed to the script:  $@"
echo "All variables/arguments are passed to the script:  $*"
echo "scriptname :$0"
echo "currect working directory :$PWD"
echo "howm directory: $HOME"
echo "who is running :$USER"
echo "PID of the running script :$$"
sleep 10 &
echo "PID of the last command wich is running in backround :$!"