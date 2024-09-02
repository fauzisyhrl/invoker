#!/bin/bash


#DEFINE REGIONS
declare -A regions

regions[BTN]="btn1-adminrc.sh"
regions[JKT2]="jkt2-adminrc.sh"
regions[WJV2]="wjv2-adminrc.sh"

#DEFINE COMMMAND

ATTACH_PROJECT() {
	openstack role add --user $user_adminrc --project $projectid_cust l1
}

SHOW_USER_ROLE() {
	openstack role assignment list --user $user_adminrc --names 
}



#MAIN PROCESS
clear
echo "==============================
C E  I N V O K E R  T O O L S
==============================
-- Attach Project --"
echo
read -p "Masukkan nama user adminrc (misal: fauzi) : " user_adminrc
read -p "Masukkan project id pelanggan (misal: 4201acc18a3948f79ebb9ba36451b3ee) : " projectid_cust


#ATTACH PROJECT PROCESS
echo
read -p "Apakah anda yakin untuk attach user $user_adminrc pada project $projectid_cust? [y/n] " konfirmasi
echo

if [ "$konfirmasi" == "y" ]; then
	source ./adminrc/${regions[$region]}
        echo "Processing $region Region....."    
	
	#BEFORE ATTACH
	echo "$region - Before"
	SHOW_USER_ROLE
	echo

	#ATTACH PROJECT
	ATTACH_PROJECT
	
	#AFTER ATTACH
	echo "$region - After"
	SHOW_USER_ROLE
	echo
	
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

source ./functions/mainmenu.sh



