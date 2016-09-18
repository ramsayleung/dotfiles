#!/bin/bash
#Author: Samray
#Description:
#Sync your shell or other configuration between your local machine and remote server
set -e
# set -x
if [ $# -lt 4 ];then
    echo "Usage: `basename $0` -u user  -h hostname -d directory"
    exit
fi
while getopts :u:h:d:p: option
do
    case "$option" in
        u) user=$OPTARG;;
        h) hostname=$OPTARG;;
        d) directory=$OPTARG;;
        p) port=$OPTARG;;
        *) echo "Unknown option:$option";;
    esac
done

if [ -z "$port" ];then
    port=22
fi
# directory=$2
# hostname=$1
# cd $2
cd $directory
tar zcvf - . | ssh $user@$hostname -p $port "cd ~; tar zpvxf -"
if [ $(echo $?) = 0 ];then
    echo "Sync successfully"
else
    echo "Sync failed ,Please check it again"
fi
