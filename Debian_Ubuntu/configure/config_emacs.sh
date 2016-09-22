#!/usr/bin/env bash
#Description:
#resolve the dependency for emacs(to make it become a delightful os)
set -e
set -x

#run as root
sudo -s <<EOF
apt-get install -y emacs 

#emacs javascript-edit mode (ie js2-mode depedency):
#install "tern" to use the auto-completion and documentation features
echo "Start to install tern"
npm install -g tern

#to use the formatting features,install js-beautify
echo "Start to install js-beautify"
npm install -g js-beautify

#syntax checker Program;which Flycheck dependens on
#  install Pylint for Python
echo "start to install Python syntax checker"
pip install pylint
# install Eslint for Javascript
echo "start to install Javascript synatx checker"
npm install eslint

#install required Python packages for Elpy
#if [ $(pip install rope;echo $?) != 0 ]
#Either of these
echo "Start to install rope "
pip install rope
#pip install jedi
#Flake8 for code checks;syntax checker as pylint
echo "Start to install flake8"
pip install flake8

#importmagic for aotumatic imports as IDE does
echo  "Start to install importmagic"
pip install importmagic

#To be able to suppress unused imports easily,install autoflake
echo "Start to install autoflake"
pip install autoflake

#and  autopep8 for automatic PEP8 formatting(which is used to format python code)
echo "Start to install autopep8"
pip install autopep8

#and yapf for code formatting
echo "Start to install yapf"
pip install yapf 

#install virtualenv for jedi (python auto-completion)
echo "Start to install virtualenv"
pip install virtualenv

#install jedi(anaconda dependencies)
echo "Start to install jedi"
pip install jedi

#install json-rpc(anaconda dependencies)
echo "Start to install json-rpc"
pip install json-rpc

#install service_factory(anaconda dependencies)
echo "Start to install service_factory"
pip install service_factory

#install epc

echo "Start to install epc"
pip install epc

EOF
echo "Start to install spacemacs"
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
