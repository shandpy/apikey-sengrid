#!/bin/bash
# @author : shandpy <icq : @shandpy>
# @tested : Ubuntu 20.04
# @name : Checking sendgrid API KEY
# 
echo " # 1. Sendgrid check limit API KEY"
echo " # 2. Sendgrid check mailfrom API KEY"
read -p " ## Choice => " CHOICE
mkdir -p Results
case $CHOICE in
	1 )
		clear 
		echo " # Checking sendgrid API KEY [Limit send]"
		read -p " # Input your list API KEY : " LIST
		for sAPI in $(cat $LIST);
		do
			./main.sh APIKeyLimit $sAPI
		done
		;;
	2 )
		clear
		echo " # Checking sendgrid API KEY [Mail From]"
		read -p " # Input your list API KEY : " LIST
		for sAPI in $(cat $LIST);
		do
			./main.sh APIKeyEmail $sAPI
		done
		;;
	*)
		echo "Please check your choice"
		;;
esac
