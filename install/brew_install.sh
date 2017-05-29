#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
# automatically install tool in OS X

function brew_install() {

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

    echo "install aria2c"
    brew install aria2c

    echo "install axel"
    brew install axel
}
