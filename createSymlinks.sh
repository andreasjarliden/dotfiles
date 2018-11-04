#!/bin/bash
DOTFILES=`find . -maxdepth 1 -name '.*' \( -type f -or -type d \) -print`
cd ..
for f in $DOTFILES; do
	if [ -e $f ]
	then
		echo Warning: $f already exists. Not linking to dotfiles.
	else
		ln -s dotfiles/$f 
	fi
done
