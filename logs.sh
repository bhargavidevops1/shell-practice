#!/bin/bash

userid=$(id -u)
logfilepath=/home/ec2-user/shell_logs
logdetails="logfilepath/$0.log"

if [ $userid -ne 0 ]; then
 echo "please login with root"
 exit 1
fi

validate(){
if [ $1 -ne 0 ]; then 
echo " $2 installation failed"
else
echo " $2 installation successful"
fi
}

dnf list installed mysql -y &>> $logdetails 

if [ $? -eq 0 ]; then
echo "aleady installed"
else
 echo "installing"
 dnf install mysql -y
 validate $? mysql
fi
 

 dnf list installed nginx -y

 if [ $? -eq 0 ]; then
 echo "already installed"
 else
 echo "installing"
 dnf install nginx -y
 validate $? nginx
fi

