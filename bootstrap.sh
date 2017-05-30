#!/usr/bin/env bash
## Heavily inspire by spf-13 bootstrap.sh

app_name='oh-my-unix'
[ -z "$APP_PATH" ] && APP_PATH="$HOME/.oh-my-unix"
[ -z "REPO_URI" ] && REPO_URI='git@github.com:samrayleung/Oh-my-unix.git'
[ -z "$REPO_BRANCH" ] && REPO_BRANCH='master'
debug_mode='0'
fork_maintainer='0'

source common_functions.sh
source install_awesome_tool.sh

sync_repo() {
    local repo_path="$1"
    local repo_uri="$2"
    local repo_branch="$3"
    local repo_name="$4"

    msg "Trying to update $repo_name"

    if [ ! -e "$repo_path" ]; then
        mkdir -p "$repo_path"
        git clone -b "$repo_branch" "$repo_uri" "$repo_path"
        ret="$?"
        success "Successfully cloned $repo_name."
    else
        cd "$repo_path" && git pull origin "$repo_branch"
        ret="$?"
        success "Successfully updated $repo_name"
    fi

    debug
}

create_symlinks() {
    local source_path="$1"
    local target_path="$2"

    lnif "$source_path/dotfile/aria2"         "$target_path/.aria2"
    lnif "$source_path/dotfile/dunstrc"       "$target_path/.dunstrc"
    lnif "$source_path/dotfile/keysnail.js"   "$target_path/.keysnail.js"
    lnif "$source_path/dotfile/zshrc"         "$target_path/.zshrc"
    lnif "$source_path/dotfile/i3"         "$target_path/.config/i3"
    lnif "$source_path/dotfile/Xmodmap"         "$target_path/.Xmodmap"

    ret="$?"
    success "Setting up symlinks."
    debug
}

variable_must_set "$HOME"
program_must_exist "git"

do_backup "$HOME/.aria2"
do_backup "$HOME/.dunstrc"
do_backup "$HOME/.keysnail.js"
do_backup "$HOME/.zshrc"
do_backup "$HOME/.config/i3"

sync_repo       "$APP_PATH" \
                "$REPO_URI" \
                "$REPO_BRANCH" \
                "$app_name"

create_symlinks "$APP_PATH" \
                "$HOME"

msg             "\nThanks for installing $app_name."

msg             "\nStart to install awesome tool"
install_awesome_tools
