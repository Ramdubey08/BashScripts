#! /bin/bash 

# Installing Dependencies
echo "#############################"
echo "Installing packages"
echo "#############################"

sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service
echo "#############################"
echo "Start & Enable HTTPD Service"
echo "#############################"


sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory 
echo "#############################"
echo "Starting Artifact Deployment"
echo "#############################"

mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo


wget https://www.tooplate.com/zip-templates/2161_vora_bold.zip > /dev/null

unzip 2161_vora_bold.zip > /dev/null
sudo cp -r 2161_vora_bold/* /var/www/html/
echo

# Bounce Service
echo "#############################"
echo "Starting HTTPD Deployment"
echo "#############################"
systemctl restart httpd
echo

# Clean Up
echo "#############################"
echo "Removing Temporary File"
echo "#############################"
rm -rf /tmp/webfiles
echo

sudo systemctl status httpd

ls /var/www/html/
