#!/usr/bin/env zsh 

# FLAGS
FLAG_INSTALL=false
FLAG_VERBOSE=false
FLAG_FORCE=false

# FUNCTIONS
Replace () {
  read -q "RESP?Do you want to replace $1? [y/N]"
  if [[ "$RESP" == 'y' ]]
  then
    cp ~/$1 .
    echo "\nFile replaced!"
  else
    echo "\nFile NOT replaced!"
  fi
}

# PROGRAM

## Read cmd args
while getopts ":ivf" opt
do
  case $opt in
    i)
      FLAG_INSTALL=true;;
    v)
      FLAG_VERBOSE=true;;
    f)
      FLAG_FORCE=true;;
    \?)
      echo "Invalid option: -$OPTARG"
      ;;
  esac
done

AddNew() {
  echo
  echo "Checking dotfile $input"
  if [ ! -f "$input" ]
  then
    echo "Adding new dotfile $input"
    cp ~/$input .
    echo "File sucessfully added!"
  fi
}

UpdateRepository() {
  old_sum=$(cat $input | md5)
  new_sum=$(cat ~/$input | md5)

  if $FLAG_FORCE || [ "$old_sum" != "$new_sum" ]
  then

    if $FLAG_VERBOSE; then
      if [ "$old_sum" != "$new_sum" ]; then
        echo "Files have different checksum!"
        echo ":::CHECKSUM:::"
        echo "Old: $old_sum | New: $new_sum"
        echo ""
      else
        echo "Both files are the same"
      fi
    fi
    Replace $input
  fi
}

## Run dotfiles
while read input
do

  if $FLAG_INSTALL; then
    if $FLAG_FORCE || [ ! -f ~/$input ]; then
      echo "Installing ~/$input ..."
      if cp $input ~/$input ; then
        echo "~/$input was sucessfully installed!"
      fi
    else
      echo "File already exists: ~/$input"
    fi
  else
    AddNew
    UpdateRepository
  fi
done <dotfiles.txt
