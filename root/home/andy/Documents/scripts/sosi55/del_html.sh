#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for folders in `find . -type f -name "Thumbs.db*"`
#FILES=*
#for folders in $FILES
do 
echo $folders
rm -rf $folders
done


for folders in `find . -type f -name "*.html"`
#FILES=*
#for folders in $FILES
do 
echo $folders
rm -rf $folders
done

for folders in `find . -type f -name "*.url"`
#FILES=*
#for folders in $FILES
do 
echo $folders
rm -rf $folders
done

for folders in `find . -type f -name "*.7z"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#rm -rf $folders
gio trash $folders
done

# restore $IFS
IFS=$SAVEIFS
