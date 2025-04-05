#!/bin/bash

function processDirectory() {
	local dir="$1"
	local pattern="$2"
	pushd . >/dev/null
	cd ..
	DOTFILES=`find dotfiles/"$dir" -mindepth 1 -maxdepth 1 -name "$pattern" \( -type f -or -type d \) -print`
	for df in $DOTFILES; do
		local f=${df#dotfiles/}
		if [ -e $f ]
		then
			if [ -L $f ]
			then
				target="$(readlink -f $f)"
        if [[ $(realpath "$target") == $(realpath "$df") ]]
				then
					echo "$f already set correctly."
				else
					echo "$f is already a symlinked but to $(readlink $f); not $df"
				fi
			else
				echo Warning: $f already exists. Not linking to dotfiles.
			fi
		else
			echo "Linking $f"
			ln --relative -s $df $f
		fi
	done
	popd >/dev/null
}

mkdir -p ../.config
processDirectory ".config" "*"
processDirectory "." ".*"
