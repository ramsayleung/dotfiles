#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
# automatically install tool in Debian/Ubuntu/Linux Mint
CURRENT_DIRECTORY=pwd
APP_ROOT="$(dirname $CURRENT_DIRECTORY)"
source "$APP_ROOT"/common_functions.sh

function apt_get_install_dependency(){
    program_exists "pip"
    if [ "$?" -ne 0 ]; then
	sudo apt-get install python-setuptools python-dev build-essential  -y
	sudo easy_install pip -y
    fi
}

function apt_get_install() {
    apt_get_install_dependency
    # install htop
    sudo apt-get install htop -y
    # install httpie
    sudo apt-get install httpie -y
    # install ag
    sudo apt-get install  silversearcher-ag -y
    # install zeal
    sudo apt-get install zeal -y
    # install ncdu
    sudo apt-get install ncdu -y
    # install i3
    sudo apt-get install i3 -y
    # install emacs (i could die without it)
    sudo apt-get install emacs -y
    # install vim
    sudo apt-get install vim -y
    # install tree
    sudo apt-get install tree -y
    # install shellcheck
    sudo apt-get install shellcheck -y
    # install guile (scheme compiler)
    sudo apt-get install guile-2.0 -y
    # install proxychains
    sudo apt-get install proxychains -y
    # install pandoc
    sudo apt-get install pandoc -y

    sudo apt-get install markdown -y

    sudo apt-get install cloc -y

    sudo apt-get install i3lock -y

    sudo apt-get install rofi -y

    sudo apt-get install feh -y

    sudo apt-get install nm-applet -y

    sudo apt-get install compton -y

    sudo apt-get instal dunst -y

    sudo apt-get install i3-sensible-terminal -y

    sudo apt-get install axel -y

    sudo apt-get install aria2c -y

    sudo apt-get install most -y

    sudo apt-get install xclip -y

    sudo apt-get install zsh -y

    sudo apt-get install -y virtualbox
}

