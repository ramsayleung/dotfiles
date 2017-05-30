#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
# automatically install tool in different os such as OS X and Linux
source ./commons_function.sh
source ./install/apt_get_install.sh
source ./install/pacman_install.sh
source ./install/brew_install.sh
source ./install/yum_dnf_install.sh
source ./install/pip_install.sh
function install_awesome_tools() {
    if [ "$(uname)" == "Darwin" ]; then
	# Do something under Mac OS X platform        
	echo "This is mac os"
	# check if brew exists
	brew_install
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	# Do something under GNU/Linux platform
	GetDistro
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
}


pip_install
