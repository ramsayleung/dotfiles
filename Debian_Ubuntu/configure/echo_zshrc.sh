#!/bin/bash
#Autho:Samray
#Description:
#cat this file and >> .zshrc
#customize alias
alias vi="vim"
alias rm="rm -rf"
alias bd="cd .."
alias mkdir="mkdir -dv"
alias diff="colordiff"
alias ports="netstat -tulanp"

function mkcd(){
    mkdir "$1"
    cd "$1"
}
