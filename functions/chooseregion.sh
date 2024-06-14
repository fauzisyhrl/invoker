#!/bin/bash


#DEFINE REGIONS
declare -A regions

regions[JKT2]="jkt2-adminrc.sh"
regions[WJV2]="wjv2-adminrc.sh"
regions[BTN]="btn1-adminrc.sh"

#DEFINE COMMMAND

DEFINE_PROJECT() {
	projectid_cust=$(openstack role assignment list --user $emailcust --user-domain neo.id | awk '{print $7}' | head -4 | tail -1)
}


#MAIN PROCESS

clear

echo "==============================
C E  I N V O K E R  T O O L S
==============================
Select Region :
1. JKT-2
2. WJV-2
3. BTN
4. MAIN MENU
"

read -p "Enter Your Choice : " number

case "$number" in

1)  region="JKT-2"
    source ./adminrc/${regions[JKT2]}
    ;;
2)  region="WJV-2"
    source ./adminrc/${regions[WJV2]}
    ;;
3)  region="BTN"
    source ./adminrc/${regions[BTN]}
    ;;
4)  source ./rubick
    ;;
*) clear
	echo
        echo "HEY!!! BISA BACA NGGAK????"
        echo
	exit 0;;
esac


echo

read -p "Masukkan Email Pelanggan: " emailcust
	#DEFINE PROJECT
	DEFINE_PROJECT

source ./functions/$function

