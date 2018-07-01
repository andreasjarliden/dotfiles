#!/bin/bash
DOTFILES=`find . -name '.*' -type f -depth 1 -print`
cd ..
for f in $DOTFILES; do
	if [ -e $f ]
	then
		echo Warning: $f already exists. Not linking to dotfiles.
	else
		ln -s dotfiles/$f 
	fi
done
