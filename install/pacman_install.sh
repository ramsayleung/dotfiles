#!/usr/bin/env bash
function arch_install(){
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

    sudo pacman -Sy ripgrep 

    sudo pacman -Sy i3lock

    sudo pacman -Sy rofi

    sudo pacman -Sy feh 

    sudo pacman -Sy compton 

    sudo pacman -Sy dunst 

    sudo pacman -S wget

    sudo pacman -S ariac2

    sudo pacman -S axel
}
