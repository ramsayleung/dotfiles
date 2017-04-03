#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
# automatically install tool in different os such as OS X and Linux
#!/usr/bin/env bash
source ./commons_function.sh

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
    echo "This is mac os"
    # check if brew exists
    type brew>/dev/null 2>&1 || {
	echo >&2 " require brew but it's not installed.  Aborting.";
	exit 1; }
    echo "install htop"
    brew install htop

    echo "install ag"
    brew install ag

    echo "install httpie"
    brew install httpie

    echo "install fasd"
    brew install fasd

    echo "install tree"
    brew install tree

    echo "install shellcheck"
    brew install shellcheck

    echo "install guile"
    brew install guile
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    GetOSVersion
    if [ "$os_VENDOR" == "Ubuntu" ] || [[ "$os_VENDOR" == "Debian" ]] || [[ "$os_VENDOR" == "LinuxMint" ]]; then
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
	sudo apt-get install guile -y

    elif [  "$os_VENDOR" == "Fedora" ] || [[ "$os_VENDOR" == "CentOS" ]] || [[ "$os_VENDOR" == "Korora" ]]; then
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


    elif [  "$os_VENDOR" == "Arch" ] ; then
	# install ag
	sudo pacman -S -y the_silver_searcher
	# install zeal
	sudo pacman -S -y zeal
	# install httpie
	sudo pacman -S -y httpie
	# install htop 
	sudo pacman -S -y htop
	# install ncdu
	sudo pacman -S -y ncdu
	# install vim
	sudo pacman -S -y vim
	# install emacs
	sudo pacman -S -y emacs
	# install i3
	sudo pacman -S -y i3
	# install tree
	sudo pacman -S -y tree
	# install shellcheck
	sudo pacman -S ShellCheck -y
	# install guile
	sudo pacman -S guile -y
    fi
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
    echo "This is 32-bit windows"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
    echo "this is 64-bit windows" 
fi
