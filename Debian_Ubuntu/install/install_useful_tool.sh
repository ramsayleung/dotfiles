#!/bin/bash
#Description:
#install the tools i think are useful

#stop run script when error raises
set -e

#show info when runs cammand
set -x
#top improved ,powerful than top

#run as root 
sudo -s <<EOF

echo "install htop"
apt-get -y install htop

#a code searching tool similar to "ack" ,maybe it is more familar with grep
#,ag is with a focus on speed
echo "install the_silver_searcher(ag)"
apt-get - y install the_silver_searcher

#lnav is an advanced log file navigator
echo "start to install the advance logfile Navigator"
apt-get -y install lnav

#Zeal is an offline documentation browser for software developers
echo "start to install Zeal"
apt-get -y install zeal

#glances is a cross-platform system monitoring tool written in python
echo "start to instal Glances"
apt-get -y install glances

#Install adobe font: source-code-pro-fonts
echo "start to install source code pro fonts "
apt-get -y install adobe-source-code-pro-fonts

#colordiff shows color when runs diff
echo "start to install colordiff"
apt-get -y install colordiff

EOF
