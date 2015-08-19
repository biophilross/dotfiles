#!/bin/bash

set -eu

if [[ $# -ne 1 ]]; then
    echo -e "###########################"
    echo -e "# Usage: bash $(basename $0) <system>"
    echo -e "# This script creates symlinks for your dotilfes"
    echo -e "############################\n"
    echo -e "For <system> choose between 'osx' and 'ubuntu'\n"
    exit
fi

system=$1

########## Variables

dir="$HOME/.dotfiles"                    # dotfiles directory
olddir="$HOME/.dotfiles_old"             # old dotfiles backup directory
files=$(ls ./$system)                    # list of files/folders to symlink in homedir

##########

# create dotfiles_old
echo -n "Creating $olddir for backup of any existing dotfiles in $HOME ..."
mkdir -p $olddir
echo "done"

# create dotfiles
echo -n "Changing to the $dir directory ..."
mkdir -p $dir
echo "done"

# move any existing dotfiles in $HOME to dotfiles_old directory, then create symlinks from $HOME to any files here
for file in $files; do
    echo "Moving any existing dotfiles from $HOME to $olddir"
    if [[ -a $HOME/.$file ]]; then
        mv $HOME/.$file $olddir
    fi
    echo "Moving files to $dir"
    mv $file $dir
    echo "Symlinking to $HOME"
    ln -s $dir/$file $HOME/.$file
done

mkdir "$HOME/.vim/un"
mkdir "$HOME/.vim/tmp"
mkdir "$HOME/.vim/backup"

exit
