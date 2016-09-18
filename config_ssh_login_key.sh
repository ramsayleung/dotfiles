#!/bin/bash
#Description:
#Help you quickly config public/private key for ssh login
#generate public/private rsa key pair,and then ssh login remote server with public/private key
#,hence we could login quickly without enter password each times
set -e
set -x

if [ $# -lt 2 ];then
    echo "Usage: `basename $0` user hostname [port(optional)]"
    exit
fi
#if public/private key doesn't exist ,generate public/private key 
if [ -f ~/.ssh/id_rsa ];then
    echo "public/private key exists"
else
    ssh-keygen -t rsa
fi

#check whether it is the first time to run this script and whether authorized_keys exists
ssh_host_and_user="$1@$2"
authorized_keys="~/.ssh/authorized_keys"
read -s -p "$ssh_host_and_user's password:" password
if [ $# -eq 3 ];then
    if sshpass -p $password  ssh -p $3 $ssh_host_and_user test -e $authorized_keys;then
        echo "authorized key exists"
        exit
    else
        sshpass -p $password ssh  $ssh_host_and_user -p $3 "mkdir .ssh;chmod 0700 .ssh"
        sshpass -p $password scp -P $3  ~/.ssh/id_rsa.pub $ssh_host_and_user:.ssh/authorized_keys
    fi
elif [ $# -eq 2 ];then
    if sshpass -p $password ssh  $ssh_host_and_user test -e $authorized_keys;then
        echo "authorized key exists"
        exit
    else
        sshpass -p $password ssh $ssh_host_and_user "mkdir .ssh;chmod 0700 .ssh"
        sshpass -p $password scp ~/.ssh/id_rsa.pub $ssh_host_and_user:.ssh/authorized_keys
    fi
fi
