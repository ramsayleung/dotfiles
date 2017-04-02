#!/bin/bash
#Description:
#Help you quickly config public/private key for ssh login
#generate public/private rsa key pair,and then ssh login remote server with public/private key
#,hence we could login quickly without enter password each times
set -e
set -x
function config_ssh_login_key(){
    if [ $# -lt 4 ];then
	echo "Usage: `basename $0` -u user -h hostname -p port"
	exit
    fi
    #if public/private key doesn't exist ,generate public/private key 
    if [ -f ~/.ssh/id_rsa ];then
	echo "public/private key exists"
    else
	ssh-keygen -t rsa
    fi
    while getopts :u:h:p: option
    do
	case "$option" in
            u) user=$OPTARG;;
            h) hostname=$OPTARG;;
            p) port=$OPTARG;;
            *) echo "Unknown option:$option";;
	esac
    done

    if [ -z "$port" ];then
	port=22
    fi
    #check whether it is the first time to run this script and whether authorized_keys exists
    # ssh_host_and_user="$1@$2"
    authorized_keys="~/.ssh/authorized_keys"
    read -s -p "$user@$hostname's password:" password
    if sshpass -p $password  ssh -p $port $user@$hostname test -e $authorized_keys;then
	echo "authorized key exists"
	exit
    else
	sshpass -p $password ssh  $user@$hostname -p $port "mkdir -p ~/.ssh;chmod 0700 .ssh"
	sshpass -p $password scp -P $port  ~/.ssh/id_rsa.pub $user@$hostname:~/.ssh/authorized_keys
    fi
}
function end_or_error_handler(){
    if [ $(echo $?) = 0 ];then
	echo "Generate successfully"
    else
	echo "Configure failed ,Plese check it again"
    fi
    exit
}
