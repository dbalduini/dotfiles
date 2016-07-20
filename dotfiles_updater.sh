#!/bin/zsh


while read input
do
  echo "\nChecking dotfile $input..."
  if [ ! -f "$input" ]
  then
    echo "Copying new dotfile $input..."
    cp ~/$input .
    echo "Copy done!"
  fi 

  old_sum=$(cat $input | md5)
  new_sum=$(cat ~/$input | md5)

  if [ "$old_sum" != "$new_sum" ]
  then
    echo "File $input has changed!"
    echo "Old: $old_sum | New: $new_sum"
    cp ~/$input .
    echo "Replace done!"
  fi
done <dotfiles.txt
