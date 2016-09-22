#!/bin/bash
#Author:Samray
#Description:
#init all the configurations and start install 
set -e
set -x
current_directory=`pwd`
for config_file in ./configure/*
do
    if [ `basename $config_file` = 'echo_zshrc.sh' ];then
        cat $config_file >> ~/.zshrc
    else
         $congig_file
    fi
done

for dotfile in ./dotfile/*
do
    origin_file=$current_directory$dotfile
    strip_file=`basename $dotfile/`
    ln -s $origin_file ~/.$strip_file 
done
