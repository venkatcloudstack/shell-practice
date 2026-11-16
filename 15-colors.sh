#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$(date "+%Y-%m-%d %H-%M-%S")
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check root acces or not 
if [ $USERID -ne 0 ]; then
    echo "please run script with root access"
    exit 1
fi

#$1= what are you trying to install
#$2= exit code
VALIDATE (){
    if [ $2 -ne 0 ]; then
        echo -e "$TIMESTAMP [ERROR] installing $1 is.... $R failed $N" | tee -a LOGS_FILE
    else
        echo -e "$TIMESTAMP [INFO] installing $1 is.... $G success $N" | tee -a LOGS_FILE
    fi
}

for package in $@
do

    echo "installing $package"
    dnf list installed $package  &>> LOGS_FILE 
    if [ $? -ne 0  ]; then
        dnf install $package -y &>> LOGS_FILE
        VALIDATE $package $?
    else
        echo "$TIMESTAMP [INFO] $package already installed ... $Y SKIPPING $N"
    
    fi
done