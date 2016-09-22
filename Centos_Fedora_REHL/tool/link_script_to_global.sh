#!/bin/bash
#Author:Samray
#Description:
#Link my scritps to /usr/local/bin/ to make them globally,and change their names
set -e
set -x
current_directory=`pwd`

ln -s $current_directory/config_ssh_login_key.sh /usr/local/bin/cssh
ln -s $current_directory/movein.sh /usr/local/bin/movein

if [ $(echo $?) = 0 ];then
    echo "link successfully "
else
    echo "link failed"
fi
