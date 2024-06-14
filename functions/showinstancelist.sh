#!/bin/bash


#DEFINE REGIONS
declare -A regions

#DEFINE COMMMAND

SHOW_SERVER_LIST() {
	openstack server list --os-project-id $projectid_cust
}

SHOW_SERVER_DETAIL() {
	openstack server show $serverid --os-project-id $projectid_cust
}

SHOW_SERVER_LOG() {
	openstack console log show $serverid --os-project-id $projectid_cust
}


#MAIN PROCESS
clear

#SHOW SERVER LIST
SHOW_SERVER_LIST

read -p "Do you want to show the server detail? [y/n] " showserverdetail

if [ "$showserverdetail" == "y" ]; then
	read -p "Enter the server id : " serverid
	#SHOW SERVER DETAIL
	SHOW_SERVER_DETAIL
fi

read -p "Do you want to show the server log? [y/n] " showinstancelog

if [ "$showinstancelog" == "y" ]; then
	read -p "Enter the server id : " serverid
	#SHOW SERVER LOG
	SHOW_SERVER_LOG
fi

echo

read -p "Press Enter to Continue..."

./rubick

