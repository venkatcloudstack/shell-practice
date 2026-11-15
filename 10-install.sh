#!/bin/bash
USERID=$(id -u)

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
        echo "$! is already installed... skipping"
        
    fi

}
#echo "iam continuing...."
dnf list installed mysql 
CHECKING mysql $?
echo "installing mysql"
dnf install mysql -y
VALIDATE mysql $?

dnf list installed nginx
if [ $? -eq o ]; then
    echo "nginx is already installed... SKIPPING"
else
    echo "installing nginx"
    VALIDATE nginx $?
