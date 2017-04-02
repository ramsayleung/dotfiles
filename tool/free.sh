#!/usr/bin/env bash
#Author: Samray
#Date: 11-27-2016
#Program:
# emptying the buffers cache 

function reduce(){
    sudo -s <<EOF
free
echo "start to sync"
sync
echo "start to empty cache"
 echo 3 >/proc/sys/vm/drop_caches
echo "flush cache done"
free
EOF
}
