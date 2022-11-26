#!/bin/bash
zenity --question --title="Query" --text="Would you like to run the script?"
case $? in
  0) lxterminal -e "bash $1"
  ;; 
  1)
  ;; 
esac
