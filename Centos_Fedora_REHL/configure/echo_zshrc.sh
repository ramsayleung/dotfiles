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
# explain.sh begins

function  explain () {
    if [ "$#" -eq 0 ]; then
        while read  -p "Command: " cmd; do
            curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$cmd"
        done
        echo "Bye!"
    elif [ "$#" -eq 1 ]; then
        curl -Gs "https://www.mankier.com/api/explain/?cols="$(tput cols) --data-urlencode "q=$1"
    else
        echo "Usage"
        echo "explain                  interactive mode."
        echo "explain 'cmd -o | ...'   one quoted command to explain it."
    fi
} 












