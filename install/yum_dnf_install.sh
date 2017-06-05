#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
# automatically install tool in Centos/Fedora

CURRENT_DIRECTORY=pwd
APP_ROOT="$(dirname $CURRENT_DIRECTORY)"
source "$APP_ROOT"/common_functions.sh
function yum_dnf_install_dependency(){
    program_exists "pip"
    if [ "$?" -ne 0 ]; then
	sudo yum install python-pip -y
	sudo yum install python-wheel -y
    fi

}

function centos_fedora_install() {
    yum_dnf_install_dependency
    # install ag
    sudo yum install -y the_silver_searcher
    # install zeal
    sudo yum install -y zeal
    # install httpie
    sudo yum install -y httpie
    # install htop 
    sudo yum install -y htop
    # install ncdu
    sudo yum install -y ncdu
    # install vim
    sudo yum install -y vim
    # install emacs
    sudo yum install -y emacs
    # install i3
    sudo yum install -y i3
    # install tree
    sudo yum install -y tree
    # install shellcheck
    sudo yum install ShellCheck -y
    # install guile
    sudo yum install guile -y
    # install source  code pro font
    sudo yum install adobe-source-code-pro-fonts -y
    # install proxychains-ng
    sudo yum install proxychains-ng -y

    sudo yum install pandoc -y

    sudo yum install markdown -y

    # count line and space in code
    sudo yum install cloc  -y

    sudo yum install i3lock -y

    sudo yum install rofi -y

    sudo yum install feh -y

    sudo yum install nm-applet -y

    sudo yum install compton -y

    sudo yum instal dunst -y

    sudo yum install i3-sensible-terminal -y

    sudo yum install aria2c -y

    sudo yum install axel -y

    sudo yum install most -y

    sudo yum install xclip -y

    sudo yum install zsh -y

    sudo yum install -y virtualbox
}

