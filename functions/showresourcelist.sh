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
Account : $emailcust
Select Resource :
1. Network List
2. Subnet List
3. Port List
4. Router List
5. Image List
6. Volume List
7. Security Group List
8. Floating IP List
9. Back
"

read -p "Enter Your Choice : " number

case "$number" in

1)	#SHOW NETWORK LIST
      	SHOW_NETWORK_LIST

	read -p "Do you want to show the network detail? [y/n] " shownetworkdetail	

	if [ "$shownetworkdetail" == "y" ]; then
		read -p "Enter the network id : " networkid
		#SHOW NETWORK DETAIL
		SHOW_NETWORK_DETAIL
	fi	
	;;

2)      #SHOW SUBNET LIST
        SHOW_SUBNET_LIST

        read -p "Do you want to show the subnet detail? [y/n] " showsubnetdetail

        if [ "$showsubnetdetail" == "y" ]; then
                read -p "Enter the subnet id : " subnetid
                #SHOW SUBNET DETAIL
                SHOW_SUBNET_DETAIL
        fi
        ;;

3)      #SHOW PORT LIST
        SHOW_PORT_LIST

        read -p "Do you want to show the port detail? [y/n] " showportdetail

        if [ "$showportdetail" == "y" ]; then
                read -p "Enter the port id : " portid
                #SHOW PORT DETAIL
                SHOW_PORT_DETAIL
        fi
        ;;

4)      #SHOW ROUTER LIST
        SHOW_ROUTER_LIST

        read -p "Do you want to show the router detail? [y/n] " showrouterdetail

        if [ "$showrouterdetail" == "y" ]; then
                read -p "Enter the router id : " routerid
                #SHOW ROUTER DETAIL
                SHOW_ROUTER_DETAIL
        fi
        ;;

5)      #SHOW IMAGE LIST
        SHOW_IMAGE_LIST

        read -p "Do you want to show the image detail? [y/n] " showimagedetail

        if [ "$showimagedetail" == "y" ]; then
                read -p "Enter the image id : " imageid
                #SHOW IMAGE DETAIL
                SHOW_IMAGE_DETAIL
        fi
        ;;

6)      #SHOW VOLUME LIST
        SHOW_VOLUME_LIST

        read -p "Do you want to show the volume detail? [y/n] " showvolumedetail

        if [ "$showvolumedetail" == "y" ]; then
                read -p "Enter the volume id : " volumeid
                #SHOW VOLUME DETAIL
                SHOW_VOLUME_DETAIL
        fi
        ;;

7)      #SHOW SECGROUP LIST
        SHOW_SECGROUP_LIST

        read -p "Do you want to show the security group detail? [y/n] " showsecgroupdetail

        if [ "$showsecgroupdetail" == "y" ]; then
                read -p "Enter the security group id : " secgroupid
                #SHOW SECGROUP DETAIL
                SHOW_SECGROUP_DETAIL
        fi
        ;;

8)      #SHOW FLOATIP LIST
        SHOW_FLOATIP_LIST

        read -p "Do you want to show the floating ip detail? [y/n] " showfloatipdetail

        if [ "$showfloatipdetail" == "y" ]; then
                read -p "Enter the floating ip id : " floatipid
                #SHOW FLOATIP DETAIL
                SHOW_FLOATIP_DETAIL
        fi
        ;;

9)	./functions/chooseregion.sh
	;;

*) clear
	echo
	echo "HEY!!! BISA BACA NGGAK????"
	echo
	exit 0;;
esac

echo

read -p "Press Enter to Continue..."

source ./functions/showresourcelist.sh

