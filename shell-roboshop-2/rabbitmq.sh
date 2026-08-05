#!/bin/bash

source ./common.sh
app_name=rabbitmq

check_root

echo "Please enter root password to setup"
read -s MYSQL_ROOT_PASSWORD

cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
VALIDATE $? "Adding rabbitmq repo"

dnf install rabbitmq-server -y
VALIDATE $? "Installing rabbitmq server"

systemctl enable rabbitmq-server
systemctl start rabbitmq-server
VALIDATE $? "starting rabbitmq server"

rabbitmqctl add_user roboshop $RABBITMQ_PASSWD
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"

print_time

#!/bin/bash

source ./common.sh
app_name=rabbitmq

check_root

echo "Please enter rabbitmq password to setup"
read -s RABBITMQ_PASSWD

cp rabbitmq.repo /etc/yum.repos.d/rabbitmq.repo
VALIDATE $? "Adding rabbitmq repo"

dnf install rabbitmq-server -y &>>$LOG_FILE
VALIDATE $? "Installing rabbitmq server"

systemctl enable rabbitmq-server &>>$LOG_FILE
VALIDATE $? "Enabling rabbitmq server"

systemctl start rabbitmq-server &>>$LOG_FILE
VALIDATE $? "Starting rabbitmq server"

rabbitmqctl add_user roboshop $RABBITMQ_PASSWD &>>$LOG_FILE
rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*" &>>$LOG_FILE

print_time