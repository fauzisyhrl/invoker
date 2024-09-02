#!/bin/bash


#DEFINE REGIONS
declare -A regions

regions[JKT2]="jkt2-adminrc.sh"
regions[WJV2]="wjv2-adminrc.sh"
regions[BTN]="btn1-adminrc.sh"

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

SHOW_SERVER_LIST_DELETED() {
        openstack server list --deleted --os-project-id $projectid_cust
}

SHOW_NETWORK_LIST() {
	openstack network list --os-project-id $projectid_cust
}

SHOW_NETWORK_DETAIL() {
	openstack network show $networkid --os-project-id $projectid_cust
}

SHOW_SUBNET_LIST() {
        openstack subnet list --os-project-id $projectid_cust
}

SHOW_SUBNET_DETAIL() {
        openstack subnet show $subnetid --os-project-id $projectid_cust
}

SHOW_PORT_LIST() {
        openstack port list --os-project-id $projectid_cust
}

SHOW_PORT_DETAIL() {
        openstack port show $portid --os-project-id $projectid_cust
}

SHOW_ROUTER_LIST() {
	 openstack router list --os-project-id $projectid_cust
}

SHOW_ROUTER_DETAIL() {
	openstack router show $routerid --os-project-id $projectid_cust
}

SHOW_IMAGE_LIST() {
	openstack image list --os-project-id $projectid_cust
}

SHOW_IMAGE_DETAIL() {
	openstack image show $imageid --os-project-id $projectid_cust
}

SHOW_VOLUME_LIST() {
	openstack volume list --os-project-id $projectid_cust
}

SHOW_VOLUME_DETAIL() {
	openstack volume show $volumeid --os-project-id $projectid_cust
}

SHOW_SECGROUP_LIST() {
	openstack security group list --os-project-id $projectid_cust
}

SHOW_SECGROUP_DETAIL() {
	openstack security group show $secgroupid --os-project-id $projectid_cust
}

SHOW_FLOATIP_LIST() {
	openstack floating ip list --os-project-id $projectid_cust
}

SHOW_FLOATIP_DETAIL() {
	openstack floating ip show $floatipid --os-project-id $projectid_cust
}


#MAIN PROCESS

clear
echo "==============================
C E  I N V O K E R  T O O L S
==============================
-- Show Instance List --
Region : $region
Select Function :
a. Attach Project
d. Detach Project
1. Instance List
2. Instace Deleted List
3. Network List
4. Subnet List
5. Port List
6. Router List
7. Image List
8. Volume List
9. Security Group List
10. Floating IP List
b. Back
"

read -p "Enter Your Choice : " number

case "$number" in


a)	region="$region"
	source ./functions/attachproject.sh
    	;;
d)	region="$region"	
	source ./functions/detachproject.sh
    	;;

1) 	read -p "Enter project id : " projectid_cust
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
	;;


2)	read -p "Enter project id : " projectid_cust
  	#SHOW SERVER LIST (DELETED)
        SHOW_SERVER_LIST_DELETED
	;;

3)	read -p "Enter project id : " projectid_cust
	#SHOW NETWORK LIST
      	SHOW_NETWORK_LIST

	read -p "Do you want to show the network detail? [y/n] " shownetworkdetail	

	if [ "$shownetworkdetail" == "y" ]; then
		read -p "Enter the network id : " networkid
		#SHOW NETWORK DETAIL
		SHOW_NETWORK_DETAIL
	fi	
	;;

4)      read -p "Enter project id : " projectid_cust
	#SHOW SUBNET LIST
        SHOW_SUBNET_LIST

        read -p "Do you want to show the subnet detail? [y/n] " showsubnetdetail

        if [ "$showsubnetdetail" == "y" ]; then
                read -p "Enter the subnet id : " subnetid
                #SHOW SUBNET DETAIL
                SHOW_SUBNET_DETAIL
        fi
        ;;

5)      read -p "Enter project id : " projectid_cust
	#SHOW PORT LIST
        SHOW_PORT_LIST

        read -p "Do you want to show the port detail? [y/n] " showportdetail

        if [ "$showportdetail" == "y" ]; then
                read -p "Enter the port id : " portid
                #SHOW PORT DETAIL
                SHOW_PORT_DETAIL
        fi
        ;;

6)      read -p "Enter project id : " projectid_cust
	#SHOW ROUTER LIST
        SHOW_ROUTER_LIST

        read -p "Do you want to show the router detail? [y/n] " showrouterdetail

        if [ "$showrouterdetail" == "y" ]; then
                read -p "Enter the router id : " routerid
                #SHOW ROUTER DETAIL
                SHOW_ROUTER_DETAIL
        fi
        ;;

7)      read -p "Enter project id : " projectid_cust
	#SHOW IMAGE LIST
        SHOW_IMAGE_LIST

        read -p "Do you want to show the image detail? [y/n] " showimagedetail

        if [ "$showimagedetail" == "y" ]; then
                read -p "Enter the image id : " imageid
                #SHOW IMAGE DETAIL
                SHOW_IMAGE_DETAIL
        fi
        ;;

8)      read -p "Enter project id : " projectid_cust
	#SHOW VOLUME LIST
        SHOW_VOLUME_LIST

        read -p "Do you want to show the volume detail? [y/n] " showvolumedetail

        if [ "$showvolumedetail" == "y" ]; then
                read -p "Enter the volume id : " volumeid
                #SHOW VOLUME DETAIL
                SHOW_VOLUME_DETAIL
        fi
        ;;

9)      read -p "Enter project id : " projectid_cust
	#SHOW SECGROUP LIST
        SHOW_SECGROUP_LIST

        read -p "Do you want to show the security group detail? [y/n] " showsecgroupdetail

        if [ "$showsecgroupdetail" == "y" ]; then
                read -p "Enter the security group id : " secgroupid
                #SHOW SECGROUP DETAIL
                SHOW_SECGROUP_DETAIL
        fi
        ;;

10)     read -p "Enter project id : " projectid_cust
	#SHOW FLOATIP LIST
        SHOW_FLOATIP_LIST

        read -p "Do you want to show the floating ip detail? [y/n] " showfloatipdetail

        if [ "$showfloatipdetail" == "y" ]; then
                read -p "Enter the floating ip id : " floatipid
                #SHOW FLOATIP DETAIL
                SHOW_FLOATIP_DETAIL
        fi
        ;;

b)	source ./rubick
	;;

*) clear
	echo
	echo "HEY!!! BISA BACA NGGAK????"
	echo
	exit 0;;
esac

echo

#Back To Main Menu

read -p "Press Enter to Continue..."

source ./functions/mainmenu.sh

