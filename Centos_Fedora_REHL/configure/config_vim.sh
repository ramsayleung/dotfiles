#!/bin/bash
#Description:
#there are some configuration about vim
echo "install spf for vim"
curl https://j.mp/spf13-vim3 -L > spf13-vim.sh && sh spf13-vim.sh

echo "Configure youcompleteme"
sudo yum install automake gcc gcc-c++ kernel-devel cmake
sudo yum install python-devel python3-devel
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

echo "configure tagbar"
wget http://downloads.sourceforge.net/project/ctags/ctags/5.8/ctags-5.8.tar.gz
tar zxvf  ctags-5.8.tar.gz
cd ctags-5.8
./configure && make && sudo make install
#remove ctags-5.8.tar.gz and ctags-5.8
cd ..
rm -rf ctags-5.8*
