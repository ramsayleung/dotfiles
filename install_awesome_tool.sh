#!/usr/bin/env bash
# Auther :Samray <samrayleung@gmail.com>
# Description:
# Automatically install tools for different OS and linus distribution, such as OS X and Linux

# Enable debug
# set -x

# Check if program exists
function program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }

    # fail on non-zero return value.
    if [ "$ret" -ne 0 ]; then
        return 1
    fi

    return 0
}

# Assert the special programs must exist.
function program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "You must have '$1' installed to continue."
    fi
}

# Install packages which don't provide binary package by git.
function git_install() {
    program_must_exist "git"

    git clone -b master git@github.com:clvv/fasd.git /tmp/fasd
    cd /tmp/fasd || exit
    sudo make install
}

function pacman_install_dependency(){
    program_exists "pip"
    if [ "$?" -ne 0 ]; then
	# install pip
	sudo pacman -S --noconfirm python-pip
    fi
}

# Install packages by pacman(For Archlinux)
function pacman_install(){
    pacman_get_install_dependency

    echo "start to install git"
    program_exists "git" || sudo pacman -S --noconfirm git

    echo "start to install rg"
    program_exists "rg" || sudo pacman -S --noconfirm ripgrep

    echo "start to install tokei"
    program_exists "tokei" || sudo pacman -S --noconfirm tokei

    echo "start to install httpie"
    program_exists "http" || sudo pacman -S --noconfirm httpie

    echo "start to install htop"
    program_exists "htop" || sudo pacman -S --noconfirm htop

    echo "start to install ncdu"
    program_exists "ncdu" || sudo pacman -S --noconfirm ncdu

    echo "start to install vim"
    program_exists "vim" || sudo pacman -S --noconfirm vim

    echo "start to install emacs"
    program_exists "emacs" || sudo pacman -S --noconfirm emacs

    ehco "start to install tree"
    program_exists "tree" || sudo pacman -S --noconfirm tree

    echo "start to install shellcheck"
    program_exists "shellcheck" || sudo pacman -S --noconfirm shellcheck 
    
    echo "start to install proxychains-ng"
    program_exists "proxychains4" || sudo pacman -S --noconfirm proxychains-ng 

    echo "start to install markdown"
    program_exists "markdown" || sudo pacman -S --noconfirm markdown

    echo "start to install fcitx"
    program_exists "fcitx" || sudo pacman -S --noconfirm fcitx

    echo "start to install aria2"
    program_exists "aria2c" || sudo pacman -S --noconfirm aria2
    
    echo "start to install mosh"
    program_exists "mosh" || sudo pacman -S --noconfirm mosh

    echo "start to install zsh"
    program_exists "zsh" || sudo pacman -S --noconfirm zsh

    echo "start to install p7zip"
    program_exists "7zr" || sudo pacman -S --noconfirm p7zip

    echo "start to install zip"
    program_exists "zip" || sudo pacman -S --noconfirm zip

    echo "start to install tldr"
    program_exists "tldr" || sudo pacman -S --noconfirm tldr

    echo "start to install fd"
    program_exists "fd" || sudo pacman -S fd --noconfirm

    echo "start to install bat"
    program_exists "bat" || sudo pacman -S bat --noconfirm

    echo "start to install fcitx-configtool"
    program_exists "fcitx-configtool" || sudo pacman -S --noconfirm fcitx-configtool 

    echo "start to install pavucontrol"
    program_exists "pavucontrol" || sudo pacman -S --noconfirm pavucontrol

    sudo pacman -S --noconfirm --needed alsa-utils alsa-plugins

    echo "start to install fzf"
    program_exists "fzf" || sudo pacman -S --noconfirm fzf
}

# Install package by brew(For MacOs)
function brew_install() {
    type brew>/dev/null 2>&1 || {
	echo >&2 " require brew but it's not installed.  Aborting.";
	exit 1; }
    # Install command if not exist
    echo "start to install htop"
    program_exists "htop" || brew install htop

    echo "start to install ripgrep"
    program_exists "rg" || brew install ripgrep

    echo "start to install rupa/z"
    program_exists "z" || brew install z

    echo "start to install tree"
    program_exists "tree" || brew install tree

    echo "start to install shellcheck"
    program_exists "shellcheck" || brew install shellcheck

    echo "start to install proxychains-ng"
    program_exists "proxychains4" || brew install proxychains-ng

    echo "start to install markdown"
    program_exists "markdown" || brew install markdown

    echo "start to install tokei"
    program_exists "tokei" || brew install tokei

    echo "start to install aria2c"
    program_exists "aria2c" || brew install aria2c

    echo "start to install tldr"
    program_exists "tldr" || brew install tldr

    echo "start to install fd"
    program_exists "fd" || brew install fd

    echo "start to install bat"
    program_exists "bat" || brew install bat

    echo "start to install exa"
    program_exists "exa" || brew install exa

    echo "start to install fzf"
    program_exists "fzf" || brew install fzf

    echo "Done"
}


function apt_get_install_dependency(){
    program_exists "pip"
    if [ "$?" -ne 0 ]; then
	sudo apt-get install python-setuptools python-dev build-essential  -y
	sudo easy_install pip -y
    fi
}

# Install packages by apt-get(For Debian/Ubuntu-based distributions)
function apt_get_install() {
    apt_get_install_dependency
    echo "start to install htop"
    program_exists "htop" || sudo apt-get install htop -y

    echo "start to install httpie"
    program_exists "http" || sudo apt-get install httpie -y

    echo "start to install ncdu"
    program_exists "ncdu" || sudo apt-get install ncdu -y

    echo "start to install emacs"
    program_exists "emacs" || sudo apt-get install emacs -y

    echo "start to install vim"
    program_exists "vim" || sudo apt-get install vim -y

    echo "start to install tree"
    program_exists "tree" || sudo apt-get install tree -y

    echo "start to install shellcheck"
    program_exists "shellcheck" || sudo apt-get install shellcheck -y

    echo "start to install proxychains"
    program_exists "proxychains4" || sudo apt-get install proxychains -y

    echo "start to install pandoc"
    program_exists "pandoc" || sudo apt-get install pandoc -y

    echo "start to install markdown"
    program_exists "markdown" || sudo apt-get install markdown -y

    echo "start to install tokei"
    program_exists "tokei" || sudo apt-get install tokei -y

    echo "start to install aria2c"
    program_exists "aria2c" || sudo apt-get install aria2c -y

    echo "start to install mosh"
    program_exists "mosh" || sudo apt-get install mosh -y

    echo "start to install zsh"
    program_exists "zsh" || sudo apt-get install zsh -y

    echo "start to install fzf"
    program_exists "fzf" || sudo apt-get install -y fzf
}


function yum_dnf_install_dependency(){
    program_exists "pip"
    if [ "$?" -ne 0 ]; then
	sudo yum install python-pip -y
	sudo yum install python-wheel -y
    fi

}

# Install packages by yum(For Centos/Fedora/RedHat-based distributions)
function centos_fedora_install() {
    yum_dnf_install_dependency

    echo "start to install httpie"
    program_exists "http" || sudo yum install -y httpie

    echo "start to install htop"
    program_exists "htop" || sudo yum install -y htop

    echo "start to install ncdu"
    program_exists "ncdu" || sudo yum install -y ncdu

    echo "start to install vim"
    program_exists "vim" || sudo yum install -y vim

    echo "start to install emacs"
    program_exists "emacs" || sudo yum install -y emacs

    echo "start to install tree"
    program_exists "tree" || sudo yum install -y tree

    echo "start to install shellcheck"
    program_exists "shellcheck" || sudo yum install ShellCheck -y

    echo "start to install proxychains-ng"
    program_exists "proxychains4" || sudo yum install proxychains-ng -y

    echo "start to install pandoc"
    program_exists "pandoc" || sudo yum install pandoc -y

    echo "start to install markdown"
    program_exists "markdown" || sudo yum install markdown -y

    echo "start to install tokei"
    program_exists "tokei" || sudo yum install tokei  -y

    echo "start to install aria2c"
    program_exists "aria2c" || sudo yum install aria2c -y

    echo "start to install mosh"
    program_exists "mosh" || sudo yum install mosh -y

    echo "start to install zsh"
    program_exists "zsh" || sudo yum install zsh -y

    echo "start to install fzf"
    program_exists "fzf" || sudo yum install -y fzf
}

# Install python packages by pip.
function pip_install {
    program_must_exist "pip"

    echo "start to install percol."
    program_exists "percol" || pip install percol --user

    echo "start to instlal icdiff."
    program_exists "icdiff" || pip install git+https://github.com/jeffkaufman/icdiff.git --user

    echo "start to instlal tldr."
    program_exists "tldr" || pip install tldr --user
}

# Install python packages by pip3.
function pip3_install {
    program_must_exist "pip3"
    pip3 install percol --user
}

function install_awesome_tools() {
    if [ "$(uname)" == "Darwin" ]; then
	# Do something under Mac OS X platform        
	echo "This is mac os"
	# check if brew exists
	brew_install
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	# Do something under GNU/Linux platform
	if type apt-get >/dev/null 2>&1; then
	    apt_get_install
	elif type yum >/dev/null 2>&1; then
	    yum_dnf_install
	elif type pacman >/dev/null 2>&1; then
	    pacman_install
	fi
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
	# Do something under 32 bits Windows NT platform
	echo "This is 32-bit windows"
    elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	# Do something under 64 bits Windows NT platform
	echo "this is 64-bit windows" 
    fi

    # Install awesome programs with pip
    # pip_install

    # Install awesome programs with git and make install
    # git_install
}

# Start to install all awesome tools
install_awesome_tools
