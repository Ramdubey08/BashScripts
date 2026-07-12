#!/bin/bash

USR='devops'

for host in `cat remhosts` 
do
	echo 
	echo "#######################################################"
	echo "Connecting to $host"
	scp MultiOs_WebsiteSetup.sh $USR@$host:/tmp/
        echo "Excuting the script $host"
	ssh $USR@$host sudo /tmp/MultiOs_WebsiteSetup.sh
	ssh $USR@$host sudo rm -rf /tmp/MultiOs_WebsiteSetup.sh
	echo "###################################################"
	echo
done 
		
