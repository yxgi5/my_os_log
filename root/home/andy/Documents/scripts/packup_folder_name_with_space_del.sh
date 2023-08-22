#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for folders in `ls -l |grep ^d |awk '{print substr($0,index($0,$9))}'`
#FILES=*
#for folders in $FILES
do 
echo $folders
tar -zcvpf $folders.tar.gz $folders/*
rm -rf $folders
#7z a -sdel $folders.7z $folders/*
#7z a -sdel -t7z -mx9 -aoa $folders.7z $folders
done

#rm packup_folder_name_with_space_del.sh
# restore $IFS
IFS=$SAVEIFS
