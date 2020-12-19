#!/bin/bash
# @author : shandpy <icq : @shandpy>
# @tested : Ubuntu 20.04
# @name : Checking sendgrid API KEY
# 

function APIKeyLimit(){
	CHKL=$(curl -skL "https://api.sendgrid.com/v3/user/credits" -H "Authorization: Bearer ${1}")
	if [[ $CHKL =~ 'used' ]]; then
		AT=$(echo $CHKL | jq .total)
		AU=$(echo $CHKL | jq .used)
		AR=$(echo $CHKL | jq .remain)
		echo "[##] ${1} [VALID]" | tee -a Results/apikey-credit.txt
		echo "[###] Total : ${AT} USED : ${AU} REMAIN : ${AR}" | tee -a Results/apikey-credit.txt
		echo "" >> Results/apikey-credit.txt
	else
		echo "[#] ${1} [NOT VALID]"
	fi
	echo
}
function APIKeyEmail(){
	CHKE=$(curl -skL "https://api.sendgrid.com/v3/user/email" -H "Authorization: Bearer ${1}")
	if [[ $CHKE =~ 'email' ]]; then
		AE=$(echo $CHKL | jq .email)
		echo "[##] ${1} [VALID]" | tee -a Results/apikey-email.txt
		echo "[###] Email : ${AE}" | tee -a Results/apikey-email.txt
		echo "" >> Results/apikey-email.txt
	else
		echo "[#] ${1} [NOT VALID]"
	fi
	echo
}
case $1 in
	APIKeyLimit )
		APIKeyLimit $2
		;;
	APIKeyEmail )
		APIKeyEmail $2 
		;;
	*)
		echo "Not found"
		;;
esac
