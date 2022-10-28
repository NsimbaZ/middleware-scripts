#!/bin/bash

## Author: Nsimba Z.
## Date: 10/27/2022

##..This script installs a list of packages on CentOS 7, Ubuntu, or Alpine...

cat /etc/os-release > os_rel
grep -i pretty_name os_rel > os_info

grep -io centos os_info

if [ $? -eq 0 ] #check if OS is CentOS
then
pkg_type=yum
pkg_method=install
yn=-y

else #if OS is not centOS
grep -io ubuntu os_info
	if [ $? -eq 0 ] #check if OS is Ubuntu
	then
	pkg_type=apt
	pkg_method=install
	yn=-y

	else
	grep -io alpine os_info
		if [ $? -eq 0 ] #check if OS is Alpine
		then
		pkg_type=apk
		pkg_method=add
		yn=""

		else #displays error: OS is not recognized
		echo "The OS version is not recognized"
		exit 1		

		fi #end of if to check for Alpine
	fi #end of if to check for Ubuntu

fi #end of if to check for CentOS

#..Installation of packages

sudo $pkg_type $pkg_method wget $yn
sudo $pkg_type $pkg_method net-utils $yn
sudo $pkg_type $pkg_method sysstat $yn
sudo $pkg_type $pkg_method finger $yn
sudo $pkg_type $pkg_method gcc $yn
sudo $pkg_type $pkg_method make $yn
sudo $pkg_type $pkg_method python3 $yn
sudo $pkg_type $pkg_method epel-release $yn
sudo $pkg_type $pkg_method git $yn

echo "package installations are completed.."
