#!/bin/bash
DOTFILES=`find . -maxdepth 1 -name '.*' \( -type f -or -type d \) -print`
cd ..
for f in $DOTFILES; do
	if [ -e $f ]
	then
		if [ -L $f ]
		then
			target="$(readlink $f)"
			if [ "$target" = "dotfiles/$f" ]
			then
				echo "$f already set correctly."
			else
				echo "$f is already a symlinked but to $(readlink $f); not dotfiles/$f"
			fi
		else
			echo Warning: $f already exists. Not linking to dotfiles.
		fi
	else
		echo "Linked $f"
		ln -s dotfiles/$f 
	fi
done
