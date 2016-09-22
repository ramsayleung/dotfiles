#!/bin/bash
#Description
#install some useful command or customize some to make it time-saving


#Install oh-my-zsh which is a delightful framework to manage zsh configuration

#Display color in man page
#when you are using fedora 22 or above ,apt-get will automatically redirect to dnf
echo "start to install most"
apt-get -y install most

if test -n "$ZSH_VERSION";then
    echo 'export PAGER="most"' >> ~/.zshrc
else test -n "$BASH_VERSION"
     echo 'export PAGER="most"' >> ~/.bashrc
fi

#set alias for some specfic file
echo "set alias for some specfic file"
if test -n "$ZSH_VERSION";then
    echo "alias -s gz='tar -xzvf'" >> ~/.zshrc
    echo "alias -s tgz='tar -xzvf'" >> ~/.zshrc
    echo "alias -s zip='unzip'" >> ~/.zshrc
    echo "alias -s bz2='tar -xjvf'" >> ~/.zshrc
    echo "alias -s php=vi" >> ~/.zshrc
    echo "alias -s py=vi" >> ~/.zshrc
    echo "alias -s rb=vi" >> ~/.zshrc
    echo "alias -s html=vi" >> ~/.zshrc
fi



#after that,when you type "xxxx.php" in your terminal,you will automatically open xxxx.php with vi
#likewise,when you type "xxxx.tgz" ,it acts as same as you type "tar zxvf xxxx.tgz"

if output=$(pip --version 2> /tmp/output);then
    pip install percol
else
    apt-get -y install pip
fi


