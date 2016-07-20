#!/usr/bin/env zsh 

Replace () {
  read -q "RESP?Do you want to replace file $1? [y/N]"
  echo $RESP
  if [[ "$RESP" == 'y' ]]
  then
    cp ~/$input .
    echo "File replaced!"
  else
    echo "File NOT replaced!"
  fi
}


while read input
do
  echo "Checking dotfile $input..."
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
    Replace $input 
  fi
done <dotfiles.txt
