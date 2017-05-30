#!/usr/bin/env bash
#Auther :Samray <samrayleung@gmail.com>
#Description:
# configure arch
function enable_service() {
    # Enable lxde window manager, so arch will startup x11 automatically
    sudo systemctl enable lxdm

    # Enable network manager, so I don't need to run "dhcpcd" manually, instead
    # Arch will help me manage network setup
    sudo systemctl enable NetworkManager.service

    sudo systemctl start NetworkManager.servre
}
