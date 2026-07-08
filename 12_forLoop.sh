#!/bin/bash 

for VAR1 in java .net python ruby php 
do 
	echo "Looping......."
	sleep 1
	echo "#############################"
	echo "Value of VAR1 is $VAR1. "
	echo "#############################"
	date 
done


MYUSERS="Aplha beta gamma"

for usr in $MYUSERS
do 
	echo "Adding user $usr. "
	useradd $usr
	id $usr
	echo "#############################"
done 

for delusr in $MYUSERS
do 
	echo "Deleting user $delusr. "
	userdel $delusr
	echo "#############################"
done
