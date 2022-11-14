#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for folders in `find . -type f -name "*.tar"`
#FILES=*
#for folders in $FILES
do 
echo $folders
tar xvf $folders
rm -rf $folders
#gio trash $folders
done

for folders in `find . -type f -name "*.7z"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#rar x -p'www.sosiba.vip' $folders
7z x -p'www.sosiba.vip' $folders
rm -rf $folders
#gio trash $folders
done

for folders in `find . -type f -name "*.rar"`
#FILES=*
#for folders in $FILES
do 
echo $folders
7z x -p'www.sosiba.vip' $folders
rm -rf $folders
#gio trash $folders
done

for folders in `find . -type f -name "*.zip"`
#FILES=*
#for folders in $FILES
do 
echo $folders
#unzip -O cp936 -P 'www.sosiba.vip' $folders
7za -p'www.sosiba.vip' -mcp=936 -y x $folders
#convmv -f GBK -t utf8 --notest -r .
rm -rf $folders
#gio trash $folders
done

for folders in `find . -maxdepth 0 -type f -name "*.mp4"`
#FILES=*
#for folders in $FILES
do 
echo $folders
mkdir `echo $folders | sed 's/\.mp4$//'`
mv $folders `echo $folders | sed 's/\.mp4$//'`
#gio trash $folders
done

for folders in `find . -type f -name "*.url"`
#FILES=*
#for folders in $FILES
do 
echo $folders
rm -rf $folders
done

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

#sync
#sync
#sync

# restore $IFS
IFS=$SAVEIFS
