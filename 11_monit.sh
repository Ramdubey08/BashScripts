#!/bin/bash

echo "#########################################"

date
ls /var/run/httpd.pid &> /dev/null

if [ $? -eq 0 ] 
then 
	echo "Httpd process is running. "
else 
	echo "Httpd process is Not running. "
	echo "Starting the process. "
	systemctl start httpd
	if [ $? -eq 0 ]
	then 
		echo "process started successfully. "
	else 
		echo "Process Starting Failed, contact the admin. "
	fi
fi 

echo "#########################################"
echo
