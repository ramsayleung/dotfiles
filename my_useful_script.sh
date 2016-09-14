#!/bin/bash
#Description
#install some useful command or customize some to make it time-saving


#Install oh-my-zsh which is a delightful framework to manage zsh configuration

#Display color in man page
#when you are using fedora 22 or above ,yum will automatically redirect to dnf
echo "start to install most"
yum install most

if test -n "$ZSH_VERSION";then
    echo 'export PAGER="most"' >> ~/.zshrc
else test -n "$BASH_VERSION"
    echo 'export PAGER="most"' >> ~/.bashrc
fi

#set alias for some specfic file
echo "set alias for some specfic file"
if test -n "$ZSH_VERSION";then
    alias -s gz='tar -xzvf'
    alias -s tgz='tar -xzvf'
    alias -s zip='unzip'
    alias -s bz2='tar -xjvf'
    alias -s php=vi
    alias -s py=vi
    alias -s rb=vi
    alias -s html=vi
fi
#after that,when you type "xxxx.php" in your terminal,you will automatically open xxxx.php with vi
#likewise,when you type "xxxx.tgz" ,it acts as same as you type "tar zxvf xxxx.tgz"

if output=$(pip --version 2> /tmp/output);then
    pip install percol
else
    yum install pip
fi

echo "start to install the advance logfile Navigator"
yum install lnav
