#!/bin/bash
#Description:
#check the disk usage,combine du and sort
function muse(){
    du -chs * | sort -rh | head -11
}
