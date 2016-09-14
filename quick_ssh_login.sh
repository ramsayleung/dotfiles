#!/bin/bash
#Description:
#generate public/private rsa key pair,and then ssh login remote server with public/private key
#,hence we could login quickly without enter password each times

if [ $# -ne 2 ];then
    echo "Usage: `basename $0` user hostname"
    exit
fi
#generate public/private key
ssh-keygen -t rsa

ssh $1@$2 "mkdir .ssh;chmod 0700 .ssh"
scp ~/.ssh/id_rsa.pub $1@$2:.ssh/authorized_keys2
