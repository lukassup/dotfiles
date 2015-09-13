#!/bin/bash

##
# .make.sh
#
# This script creates symlinks
# from the home directory to any
# desired dotfiles in ~/dotfiles
##

## Variables

dir=$HOME/dotfiles           # dotfiles directory
olddir=$HOME/dotfiles_old    # old dotfiles backup directory
files+=(*)               # get files in the current dir
declare -a files=("${files[@]/README.md/}")  # skip README.md

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo " done."

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo " done."

# Move any existing dotfiles in homedir
# to $olddir directory, then create
# symlinks from the homedir to any files
# in the ~/dotfiles directory specified in $files

for file in ${files[@]}; do
#   echo "Moving any existing dotfiles from $HOME to $olddir"
    mv -v ~/.$file $olddir
#   echo "Creating symlink to $file in $HOME\."
    ln -vs $dir/$file ~/.$file
done

