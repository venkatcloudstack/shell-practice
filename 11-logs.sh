USERID=$(id -u)

#check root acces or not 
if [ $USERID -ne 0 ]; then
    echo "please run script with root access"
    exit 1
fi

#$1= what are you trying to install
#$2= exit code
VALIDATE (){
    if [ $2 -ne 0 ]; then
        echo " installing $1 is.... failed"
    else
        echo " installing $1 is.... success"
    fi
}

dnf list installed mysql

if [ $? -eq 0]; then
    echo "mysql is already installed...  skipping"
else
    echo "installing mysql"
    dnf install mysql -y
    VALIDATE mysql $?
fi

dnf list installed nginx
if [ $? -eq 0]; then
    echo "nginx is already installed...  skipping"
else
    echo "installing nginx"
    dnf install nginx -y
    VALIDATE nginx $?
fi

