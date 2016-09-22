#!/bin/bash
#Description:
#install the tools i think are useful

#stop run script when error raises
set -e

#show info when runs cammand
set -x

#run as root
sudo -s <<EOF

#top improved ,powerful than top
echo "install htop"
yum -y install htop

#a code searching tool similar to "ack" ,maybe it is more familar with grep
#,ag is with a focus on speed
echo "install the_silver_searcher(ag)"
yum - y install the_silver_searcher

#lnav is an advanced log file navigator
echo "start to install the advance logfile Navigator"
yum -y install lnav

#Zeal is an offline documentation browser for software developers
echo "start to install Zeal"
yum -y install zeal

#glances is a cross-platform system monitoring tool written in python
echo "start to instal Glances"
yum -y install glances

#Install adobe font: source-code-pro-fonts
echo "start to install source code pro fonts "
yum -y install adobe-source-code-pro-fonts

#colordiff shows color when runs diff
echo "start to install colordiff"
yum -y install colordiff

EOF
