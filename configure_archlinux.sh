
function install_depency() {

    sudo pacman -Sy network-manager-applet

    sudo pacman -S networkmanager
}

function enable_service() {
    # Enable lxde window manager, so arch will startup x11 automatically
    sudo systemctl enable lxdm

    # Enable network manager, so I don't need to run "dhcpcd" manually, instead
    # Arch will help me manage network setup
    sudo systemctl enable NetworkManager.service

    sudo systemctl start NetworkManager.servre
}
