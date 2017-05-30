#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
# automatically install awesome tool with pip
CURRENT_DIRECTORY=pwd
APP_ROOT="$(dirname $CURRENT_DIRECTORY)"
source $APP_ROOT/common_functions.sh
program_must_exist "pip"

function pip_install {
    sudo pip install percol
}
