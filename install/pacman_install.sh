#!/usr/bin/env bash
function pacman_install(){
    # install ag
    sudo pacman -S --noconfirm the_silver_searcher
    # install zeal
    sudo pacman -S --noconfirm zeal
    # install httpie
    sudo pacman -S --noconfirm httpie
    # install htop 
    sudo pacman -S --noconfirm htop
    # install ncdu
    sudo pacman -S --noconfirm ncdu
    # install vim
    sudo pacman -S --noconfirm vim
    # install emacs
    sudo pacman -S --noconfirm emacs
    # install i3
    sudo pacman -S --noconfirm i3
    # install tree
    sudo pacman -S --noconfirm tree
    # install shellcheck
    sudo pacman -S --noconfirm ShellCheck 
    # install guile
    sudo pacman -S --noconfirm guile 
    # install source-code-pro font
    sudo pacman -S --noconfirm adobe-source-code-pro-fonts 
    # install proxychains-ng
    sudo pacman -S --noconfirm proxychains-ng 

    sudo pacman -S --noconfirm pandoc 

    sudo pacman -S --noconfirm markdown

    sudo pacman -S --noconfirm ripgrep

    sudo pacman -S --noconfirm cloc

    sudo pacman -S --noconfirm ripgrep 

    sudo pacman -S --noconfirm i3lock

    sudo pacman -S --noconfirm rofi

    sudo pacman -S --noconfirm feh 

    sudo pacman -S --noconfirm compton 

    sudo pacman -S --noconfirm dunst 

    sudo pacman -S --noconfirm wget 
    
    sudo pacman -S --noconfirm ariac2 
    
    sudo pacman -S --noconfirm axel  
}
