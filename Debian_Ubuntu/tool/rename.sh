#!/bin/bash
#Autho:Samray
#Description:
#rename all the image to sequential numbers

#import function
source ./space_to_underscores.sh 
DIRECTORY_PATH='/home/samray/Music/full/'
replace_spaces_to_underscores $DIRECTORY_PATH

for album in $DIRECTORY_PATH*
do

    echo "$album album"
    a=1
    for image in $album/* 
    do
    echo "$image  filename"
        new=$(printf "%04d.jpg" "$a")
        mv -- "$image" "$album/$new"
        let a=a+1
    done
done
