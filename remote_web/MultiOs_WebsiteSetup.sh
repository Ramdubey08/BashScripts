#!/bin/bash 

# Variable Declaration
#PACKAGE="httpd wget unzip"
#SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2161_vora_bold.zip"
ART_NAME="2161_vora_bold"
TEMPDIR="/tmp/webfiles"


yum --help &> /dev/null
if [ $? -eq 0 ]
then
	# Set Variables for Centos
	PACKAGE="httpd wget unzip"
	SVC="httpd"

	echo "Running Setup on CentOS"
	# Installing Dependencies
	echo "#############################"
	echo "Installing packages"
	echo "#############################"

	sudo yum install $PACKAGE -y > /dev/null
	echo

	# Start & Enable Service
	echo "#############################"
	echo "Start & Enable HTTPD Service"
	echo "#############################"


	sudo systemctl start $SVC
	sudo systemctl enable $SVC
	echo

	# Creating Temp Directory 
	echo "#############################"
	echo "Starting Artifact Deployment"
	echo "#############################"

	mkdir -p $TEMPDIR
	cd $TEMPDIR
	echo


	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null
	sudo cp -r $ART_NAME/* /var/www/html/
	echo

	# Bounce Service
	echo "#############################"
	echo "Starting HTTPD Deployment"
	echo "#############################"
	systemctl restart $SVC
	echo

	# Clean Up
	echo "#############################"
	echo "Removing Temporary File"
	echo "#############################"
	rm -rf $TEMPDIR
	echo

	sudo systemctl status $SVC

	ls /var/www/html/

else 
	# Set Variables for Ubuntu
   PACKAGE="apache2 wget unzip"
   SVC="apache2"

   echo "Running Setup on Ubuntu"
   # Installing Dependencies
   echo "########################################"
   echo "Installing packages."
   echo "########################################"
   sudo apt update
   sudo apt install $PACKAGE -y > /dev/null
   echo

   # Start & Enable Service
   echo "########################################"
   echo "Start & Enable apache2 Service"
   echo "########################################"
   sudo systemctl start $SVC
   sudo systemctl enable $SVC
   echo

   # Creating Temp Directory
   echo "########################################"
   echo "Starting Artifact Deployment"
   echo "########################################"
   mkdir -p $TEMPDIR
   cd $TEMPDIR
   echo

   wget $URL > /dev/null
   unzip $ART_NAME.zip > /dev/null
   sudo cp -r $ART_NAME/* /var/www/html/
   echo

   # Bounce Service
   echo "########################################"
   echo "Restarting apache2 service"
   echo "########################################"
   systemctl restart $SVC
   echo

   # Clean Up
   echo "########################################"
   echo "Removing Temporary Files"
   echo "########################################"
   rm -rf $TEMPDIR
   echo

   sudo systemctl status $SVC
   ls /var/www/html/
fi
