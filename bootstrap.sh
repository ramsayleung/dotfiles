#!/usr/bin/env bash
## Heavily inspire by spf-13 bootstrap.sh

set -ex
app_name='oh-my-unix'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.oh-my-unix"
debug_mode='0'
fork_maintainer='0'

source ./common_functions.sh
source ./install_awesome_tool.sh
source ./install/pip_install.sh

create_symlinks() {
    local source_path="$1"
    local target_path="$2"

    lnif "$source_path/dotfile/.aria2"         "$target_path/.aria2"
    lnif "$source_path/dotfile/.dunstrc"       "$target_path/.dunstrc"
    lnif "$source_path/dotfile/.keysnail.js"   "$target_path/.keysnail.js"
    lnif "$source_path/dotfile/.zshrc"         "$target_path/.zshrc"
    lnif "$source_path/dotfile/i3"         "$target_path/.config/i3"
    lnif "$source_path/dotfile/.Xmodmap"         "$target_path/.Xmodmap"

    ret="$?"
    success "Setting up symlinks."
    debug
}

# Install awesome programs with built-in package manager
install_awesome_tools
# Install awesome programs with pip
pip_install
# Install awesome programs with git and make install
git_install

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
variable_must_set "$HOME"
program_must_exist "git"

do_backup "$HOME/.aria2"
do_backup "$HOME/.dunstrc"
do_backup "$HOME/.keysnail.js"
do_backup "$HOME/.zshrc"
do_backup "$HOME/.config/i3"

create_symlinks "$APP_PATH" \
                "$HOME"

msg             "\nThanks for installing $app_name."

msg             "\nStart to install awesome tool"

