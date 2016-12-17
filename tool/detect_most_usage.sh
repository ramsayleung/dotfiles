#!/bin/bash
#Description:
#check the disk usage,combine du and sort
du -chs * | sort -rh | head -11
