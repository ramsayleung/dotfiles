#!/usr/bin/env bash
OS_NAME=$(uname)
function pclip() {
    if [ $OS_NAME = "CYGWIN" ]; then
        putclip "$@";
    elif [ $OS_NAME = "Darwin" ]; then
        pbcopy "$@";
    else
        if [ -x /usr/bin/xsel ]; then
            xsel -ib "$@";
        else
            if [ -x /usr/bin/xclip ]; then
                xclip -selection c "$@";
            else
                echo "Neither xsel or xclip is installed!"
            fi
        fi
    fi
}

function pwdf()
{
    local current_dir=$(pwd)
    local copied_file=$(find $current_dir -type f -print |percol)
    echo -n $copied_file |pclip;
}

#check the disk usage,combine du and sort
function muse(){
    du -chs * | sort -rh | head -11
}

# select git commit
function sgc(){
    git log --pretty=oneline |percol|cut -d " " -f 1
}

# select git branch
function sgb(){
    git branch | percol
}

#Help you quickly config public/private key for ssh login
#generate public/private rsa key pair,and then ssh login remote server with public/private key
#,hence we could login quickly without enter password each times

function config_ssh_login_key(){
    if [ $# -lt 4 ];then
	echo "Usage: $( basename $0 ) -u user -h hostname -p port"
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

# emptying the buffers cache 

function reduce(){
    free
    echo "start to sync"
    sync
    echo "start to empty cache"
    sudo echo 3 >/proc/sys/vm/drop_caches
    echo "flush cache done"
    free
}

#replace spaces to underscores

function replace_spaces_to_underscores {
    for file in $1*
    do
        mv "$file" $( echo $file | tr ' ' '_' ) ;
    done 
}
function ppgrep() {
    if [[ $1 == "" ]]; then
        PERCOL=percol
    else
        PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
}

function ppkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# -gt 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
}

function proxy_off() {
    unset http_proxy
    unset https_proxy
    echo -e "proxy is down"
}
function proxy_on(){
    export no_proxy="locahost,127.0.0.1,localaddress,.localdomain.com"
    export http_proxy="http://127.0.0.1:8118"
    export https_proxy=$http_proxy
    echo -e "proxy is on"
}
function mkcd(){
    mkdir "$1"
    cd "$1"
}
# #to enable fasd
function enable_fasd(){
    eval "$(fasd --init auto)"
    alias a='fasd -a'        # any
    alias s='fasd -si'       # show / search / select
    alias d='fasd -d'        # directory
    alias f='fasd -f'        # file
    alias sd='fasd -sid'     # interactive directory selection
    alias sf='fasd -sif'     # interactive file selection
    alias z='fasd_cd -d'     # cd, same functionality as j in autojump
    alias zz='fasd_cd -d -i' # cd with interactive selection
}
enable_fasd

function setup_alias(){
    alias vi="vim"
    alias axel="axel -n 10"
    alias aria2c="aria2c -x 10"
    alias rm="rm -rf"
    alias bd="cd .."
    alias mkdir="mkdir -v"
    alias diff="colordiff"
    alias ports="netstat -tulanp"
    alias npm="cnpm"
}

#
# Set PAGER bash/zsh shell variable
export PAGER="most"
