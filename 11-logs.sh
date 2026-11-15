#!/bin/bash
USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log"

#check root access or not
if [ $USERID -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi

#$1=what are you trying to install
#$2=exit code
VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "installing $1... FAILED"
        exit 1
    else
        echo "installing $1...SUCCESS"
    fi
}
#$1=what are you checking 
#$2=exit code
CHECKING(){
    if [ $2 -ne 0 ]; then
        echo "$1 is not installed"
    
    else 
        echo "$1 is already installed... skipping"
        
    fi

}
#echo "iam continuing...."
dnf list installed mysql &>> LOGS_FILE
CHECKING mysql $?
echo "installing mysql"
dnf install mysql -y    &>> LOGS_FILE
VALIDATE mysql $?

dnf list installed nginx  &>> LOGS_FILE
CHECKING nginx $?
    echo "installing nginx"
    dnf install nginx -y  &>> LOGS_FILE
    VALIDATE nginx $?
