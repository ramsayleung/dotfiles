#!/bin/bash
#Author:Samray
#Description:
#init all the configurations and start install 
set -e
set -x
current_directory=`pwd`
for install_file in ./install/*
do
    chmod +x $install_file
    #run the install script
    $install_file
done
for config_file in ./configure/*
do
    if [ `basename $config_file` = 'echo_zshrc.sh' ];then
        cat $config_file >> ~/.zshrc
    else
        chmod +x $config_file
        $config_file
    fi
done

for dotfile in ./dotfile/*
do
    origin_file=$current_directory$dotfile
    strip_file=`basename $dotfile/`
    ln -s $origin_file ~/.$strip_file 
done
