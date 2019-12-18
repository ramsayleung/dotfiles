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
    echo -n "$copied_file" |pclip;
}

function pwdp(){
    pwd|pclip;
}

# generate key
function gkey(){
    if [ -n "$1" ];then
	local length="$1"
    else
	local length=32
    fi
    OS_NAME=$(uname)
    if [ $OS_NAME = "Darwin" ]; then
	LC_CTYPE=C cat /dev/urandom |tr -cd "[:alnum:]"|head -c "$length";echo
    else
	cat /dev/urandom |tr -cd "[:alnum:]"|head -c "$length";echo
    fi
}

#check the disk usage,combine du and sort
function muse(){
    du -chs * | sort -rh | head -11
}

# select git commit
function sgl(){
    git log --pretty=oneline | fzf |cut -d " " -f 1,2
}

# select git branch
function sgb(){
    git branch | fzf
}

function sgc(){
    git checkout $(sgb)
}

# Help you quickly config public/private key for ssh login
# generate public/private rsa key pair,and then ssh login remote server with public/private key
# hence we could login quickly without enter password each times

function config_ssh_login_key(){
    if [ $# -lt 3 ];then
	echo "Usage: $(basename $0) -u user -h hostname -p port"
	kill -INT $$
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
    authorized_keys="$HOME/.ssh/authorized_keys"
    printf "$user@$hostname's password:";read -r -s password
    if sshpass -pv $password ssh -p "$port" "$user@$hostname" test -e "$authorized_keys";then
	echo "authorized key exists"
	kill -INT $$
    else
	sshpass -p $password ssh  $user@$hostname -p $port "mkdir -p ~/.ssh;chmod 0700 .ssh"
	sshpass -p $password scp -P $port  ~/.ssh/id_rsa.pub $user@$hostname:~/.ssh/authorized_keys
	# ssh-copy-id "$user@$hostname -p $port"
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
function fgrep() {
    if [[ $1 == "" ]]; then
        FZF=fzf
    else
        FZF="fzf -q $1"
    fi
    ps aux | eval $FZF | awk '{ print $2 }'
}

function fkill() {
    if [[ $1 =~ "^-" ]]; then
        QUERY=""            # options only
    else
        QUERY=$1            # with a query
        [[ $# -gt 0 ]] && shift
    fi
    fgrep $QUERY | xargs kill $*
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
    target_dir="$1"
    mkdir "$target_dir"
    cd "$target_dir"
}

#
# Set PAGER bash/zsh shell variable
export PAGER="most"
