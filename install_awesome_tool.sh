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

    echo "install proxychains-ng"
    brew install proxychains-ng

    echo "install pandoc"
    brew install pandoc

    echo "install markdown"
    brew install markdown

    echo "install cloc"
    brew install cloc
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
	# install source code pro font
	[ -d /usr/share/fonts/opentype ] || sudo mkdir /usr/share/fonts/opentype
	sudo git clone https://github.com/adobe-fonts/source-code-pro.git /usr/share/fonts/opentype/scp
	sudo fc-cache -f -v
	# install proxychains-ng
	sudo apt-get install proxychains-ng -y
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
	# install source  code pro font
	sudo yum install adobe-source-code-pro-fonts -y
	# install proxychains-ng
	sudo yum install proxychains-ng -y

	sudo yum install pandoc -y

	sudo yum install markdown -y

	# count line and space in code
	sudo yum install cloc  -y

	sudo yum install i3lock -y

	sudo yum install rofi -y

	sudo yum install feh -y

	sudo yum install nm-applet -y

	sudo yum install compton -y

	sudo yum instal dunst -y

	sudo yum install i3-sensible-terminal -y
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
	# install source-code-pro font
	sudo pacman -S adobe-source-code-pro-fonts -y
	# install proxychains-ng
	sudo pacman -S proxychains-ng -y

	sudo pacman -S pandoc -y

	sudo pacman -S markdown -y

	sudo pacman -S ripgrep -y

	sudo pacman -S cloc  -y
	sudo pacman -S ripgrep 

	sudo pacman -Sy i3lock

	sudo pacman -Sy rofi

	sudo pacman -Sy install feh 

	sudo pacman -Sy install nm-applet 

	sudo pacman -Sy install compton 

	sudo pacman -Sy instal dunst 

	sudo pacman -Sy install i3-sensible-terminal 
    fi
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
    # Do something under 32 bits Windows NT platform
    echo "This is 32-bit windows"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
    echo "this is 64-bit windows" 
fi
