#!/bin/zsh

for filename in `cat dotfiles.txt`
do
  while read input
  do
    echo $input
  done <$filename
done
