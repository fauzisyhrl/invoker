#!/bin/bash


#DEFINE REGIONS
declare -A regions

regions[BTN]="btn1-adminrc.sh"
regions[JKT2]="jkt2-adminrc.sh"
regions[WJV2]="wjv2-adminrc.sh"

#DEFINE COMMMAND

DEFINE_PROJECT() {
	userid_adminrc=$(openstack user show $user_adminrc | awk '{print $4}' | head -9 | tail -1)
	projectid_cust=$(openstack role assignment list --user $emailcust --user-domain neo.id | awk '{print $7}' | head -4 | tail -1)
}

ATTACH_PROJECT() {
	openstack role add --user $userid_adminrc --project $projectid_cust l1
}

SHOW_USER_ROLE() {
	openstack role assignment list --user $userid_adminrc --names 
}



#MAIN PROCESS
clear
echo "==============================
C E  I N V O K E R  T O O L S
==============================
-- Attach Project --"
echo
read -p "Masukkan user adminrc : " user_adminrc
read -p "Masukkan email pelanggan : " emailcust


#ATTACH PROJECT PROCESS
echo
read -p "Apakah anda yakin untuk attach user $user_adminrc pada project $emailcust? [y/n] " konfirmasi
echo

if [ "$konfirmasi" == "y" ]; then
    for region in "${!regions[@]}"; do
        source ./adminrc/${regions[$region]}
        echo "Processing $region Region....."    
	
	#DEFINE PROJECT
	DEFINE_PROJECT

	#BEFORE ATTACH
	echo "$region - Before"
	SHOW_USER_ROLE
	echo

	#ATTACH PROJECT
	ATTACH_PROJECT
	
	#AFTER ATACH
	echo "$region - After"
	SHOW_USER_ROLE
	echo
    done
	
    SP=1
	    
else
    echo "Oke, Sampai Jumpa...
    "
    exit 0
fi


if [ "$SP" == 1 ]; then
    echo "Attach Project Berhasil...
    "
    
else
    echo "Attach Project tidak berhasil...
    "
fi

read -p "Press Enter to Continue..."

./rubick
