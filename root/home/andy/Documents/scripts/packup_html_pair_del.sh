#!/bin/bash

# BASH Shell: For Loop File Names With Spaces
# Set $IFS variable
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

for files in `find . -maxdepth 1 -type f -name "*.html" | sed 's/\.html$//' | sed 's/^.\///'`
do
  #echo mkdir -p $files
  mkdir -p $files
  #echo `find . -maxdepth 1 -name "./$files*"`
  #for file1 in `find . -maxdepth 1 -name "*" | grep "files"`
  for file1 in "$files"*
    do
    #echo $file1 | grep -v $files$ 
    if [[ "`echo $file1 | grep -v $files$`" != "" ]]
    #if [[ "`echo $file1 | grep -v $files$`" != "" ]] && [[ "`echo $file1` != `echo $files`" ]]
    then
      #echo $file1 | grep -v $files$
      #echo "haha"
      #echo mv `echo $file1 | grep -v $files$` $files
      mv `echo $file1 | grep -v $files$` $files
    fi
  done
  #tar -zcvpf $folders.tar.gz $folders/*
  #rm -rf $folders
  #7z a -sdel $folders.7z $folders/*
  7z a -sdel -t7z -mx9 -aoa $files.7z $files
done

for files in `find . -maxdepth 1 -type f -name "*.htm" | sed 's/\.htm$//' | sed 's/^.\///'`
do
  #echo mkdir -p $files
  mkdir -p $files
  #echo `find . -maxdepth 1 -name "./$files*"`
  #for file1 in `find . -maxdepth 1 -name "*" | grep "files"`
  for file1 in "$files"*
    do
    #echo $file1 | grep -v $files$ 
    if [[ "`echo $file1 | grep -v $files$`" != "" ]]
    #if [[ "`echo $file1 | grep -v $files$`" != "" ]] && [[ "`echo $file1` != `echo $files`" ]]
    then
      #echo $file1 | grep -v $files$
      #echo "haha"
      #echo mv `echo $file1 | grep -v $files$` $files
      mv `echo $file1 | grep -v $files$` $files
    fi
  done
  #tar -zcvpf $folders.tar.gz $folders/*
  #rm -rf $folders
  #7z a -sdel $folders.7z $folders/*
  7z a -sdel -t7z -mx9 -aoa $files.7z $files
done

for files in `find . -maxdepth 1 -type f -name "*.shtml" | sed 's/\.shtml$//' | sed 's/^.\///'`
do
  #echo mkdir -p $files
  mkdir -p $files
  #echo `find . -maxdepth 1 -name "./$files*"`
  #for file1 in `find . -maxdepth 1 -name "*" | grep "files"`
  for file1 in "$files"*
    do
    #echo $file1 | grep -v $files$ 
    if [[ "`echo $file1 | grep -v $files$`" != "" ]]
    #if [[ "`echo $file1 | grep -v $files$`" != "" ]] && [[ "`echo $file1` != `echo $files`" ]]
    then
      #echo $file1 | grep -v $files$
      #echo "haha"
      #echo mv `echo $file1 | grep -v $files$` $files
      mv `echo $file1 | grep -v $files$` $files
    fi
  done
  #tar -zcvpf $folders.tar.gz $folders/*
  #rm -rf $folders
  #7z a -sdel $folders.7z $folders/*
  7z a -sdel -t7z -mx9 -aoa $files.7z $files
done


#for files in `find . -maxdepth 1 -type f -name "*.7z" | sed 's/^.\///'`
#do
#  #echo "$files" | sed 's/ - 技術討論區 _ 草榴社區 - t66y.com//'
#  mv "$files" `echo "$files" | sed 's/ - 技術討論區 _ 草榴社區 - t66y.com//'`
#done


#rm packup_html_pair_del.sh
# restore $IFS
IFS=$SAVEIFS




#files="[GIF动图]肛门破坏计划 第二弹[96P] - 技術討論區 _ 草榴社區 - t66y.com"
#file1="[GIF动图]肛门破坏计划 第二弹[96P] - 技術討論區 _ 草榴社區 - t66y.com"

#files="米柚(MIUI)系统手机如何通过无线网连接电脑 百度经验"
#file1="米柚(MIUI)系统手机如何通过无线网连接电脑 百度经验"

#echo "$file1" | grep -v "$files"

#for files in `find . -maxdepth 1 -type f -name "*.html"`
#do
#echo `echo $files | sed 's/\.html$//' | sed 's/^.\///'`
##mkdir -p `echo $files | sed 's/\.html$//' | sed 's/^.\///'`
#done
#
#for files in `find . -maxdepth 1  -type f -name "*.html"`
#do
#ls | grep -v `echo $files | sed 's/\.htm*$//'`
#done
#mv `echo $files | sed 's/\.html$//' | sed 's/^.\///'`* `echo $files | sed 's/\.html$//' | sed 's/^.\///'`
#ls `echo $files | sed 's/\.htm*$//'`* | grep -v `echo $files | sed 's/\.htm*$//'` | sed 's/^.\///'` | xargs -t -I '{}' mv {} exclude-dir
#find . -maxdepth 1 -type d -exec ls -ld "{}" \;
#find . -not -type d -and -not -regex '\./exclude-dir/.*' -exec echo mv {} f1 \;
#find . -maxdepth 1 -not -type d -and -not -regex '\./exclude-dir/.*' -exec mv {} f1 \;
#find . -maxdepth 1 -and -not -regex '\./exclude-dir/.*' -exec echo mv {} f1 \;
#find . -maxdepth 1 -and -not -regex `find . -maxdepth 1 -type f -name "*.htm*" | sed 's/\.htm.$//'`
#find . -maxdepth 1 -and -not -regex ./`find . -maxdepth 1 -type f -name "*.htm*" | sed 's/\.htm.$//' | sed 's/^.\///'` -exec echo mv {} `find . -maxdepth 1 -type f -name "*.htm*" | sed 's/\.htm.$//' | sed 's/^.\///'` \;
#mv $(ls --ignore=file1 --ignore==folder1 --ignore==regular-expression1 ...) destination/
#ls | grep -v exclude-dir | xargs -t -I '{}' mv {} exclude-dir




