**Invoker** is a bash script used as a BGN support operational tool to simplify the OpenStack command.

## Features
 - Attach & Detach user to a project by email
 - Show Resource (Instance, Network, Subnet, Port, Router, Image, Volume, Security Group, Floating IP) list & details on a project
 - Show Instance Log

## Preparation
Invoker can be used if you have installed the OpenStack client in your bash script environment, see the documentation regarding the OpenStack client [here](https://wiki.openstack.org/wiki/OpenStackClients).

You need to replace the OpenStack admin_rc files with your personal admin_rc according to each region (JKT2, WJV2 and BTN) in **adminrc folder**.

*Please dont change the name of the file.

## Running script
Running this command on the main folder.

    $ ./rubick

Before use features you need to attach your user to the project with **Attach Project** feature.

## Documentation

 - [Openstack comand list documentation](https://docs.openstack.org/python-openstackclient/pike/cli/command-list.html)
