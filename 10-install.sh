#!/bin/bash
USERID=$(id -u)

#check root access or not
if [ $USERID -ne 0 ]; then
    echo "please run this script with root access"
    exit 1
fi

#echo "iam continuing...."
dnf list installed mysql 
if [ $? -ne 0 ]; then
    echo "mysql is not installed"
else 
    echo "mysql is already installed... skipping"
    exit 1
fi
echo "installing mysql"
dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "installing mysql... FAILED"
    exit 1
else
    echo "installing mysql...SUCCESS"
fi
