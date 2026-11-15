#!/bin/bash

####  special vars  ####
echo "all variables passed to the script : $@"
echo "number of variables passed to the script : $#"
echo "first variable: $1"
echo "script name : $0"
echo "who is running this : $USER"
echo "which directory : $PWD"
echo "home directory : $HOME"
echo "pid of the current script : $$"
sleep 5 &
echo" pid of the background command running justnow : %!"
wait $!
echo "linenumber is $LINENO"
echo "script excuted in $SECONDS seconds"
echo "random number is :$RANDOM"
echo "exit code of previous command : $?"
