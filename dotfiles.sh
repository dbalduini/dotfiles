#!/usr/bin/env zsh 

# FLAGS
FLAG_INSTALL=false
FLAG_VERBOSE=false

# FUNCTIONS
Replace () {
  read -q "RESP?Do you want to replace $1? [y/N]"
  echo $RESP
  if [[ "$RESP" == 'y' ]]
  then
    echo "Replacing file $1..."
    cp ~/$1 .
    echo "File replaced!"
  else
    echo "File NOT replaced!"
  fi
}

# PROGRAM

## Read cmd args
while getopts ":iv" opt
do
  case $opt in
    i)
      FLAG_INSTALL=true;;
    v)
      FLAG_VERBOSE=true;;
    \?)
      echo "Invalid option: -$OPTARG"
      ;;
  esac
done

## Run dotfiles
while read input
do
  echo "Checking dotfile $input..."
  if [ ! -f "$input" ]
  then
    echo "Adding new dotfile $input..."
    cp ~/$input .
    echo "File sucessfully added!"
  fi 

  old_sum=$(cat $input | md5)
  new_sum=$(cat ~/$input | md5)

  if [ "$old_sum" != "$new_sum" ]
  then
    echo "File $input has changed!"
    if $FLAG_VERBOSE; then
      echo "Old: $old_sum | New: $new_sum"
    fi
    Replace $input
  fi
done <dotfiles.txt
