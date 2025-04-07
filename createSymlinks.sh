#!/bin/bash

# MacOS lacks readlink and ln --relative so use the gnu equivalents. Can be
# installed using `brew install coreutils`
if command -v greadlink >/dev/null; then
	READLINK_CMD=greadlink
else
	READLINK_CMD=readlink
fi

if command -v gln >/dev/null; then
	LN_CMD=gln
else
	LN_CMD=ln
fi


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
				target="$($READLINK_CMD -f $f)"
        if [[ $(realpath "$target") == $(realpath "$df") ]]
				then
					echo "$f already set correctly."
				else
					echo "$f is already a symlinked but to $(READLINK_CMD -f $f); not $df"
				fi
			else
				echo Warning: $f already exists. Not linking to dotfiles.
			fi
		else
			echo "Linking $f"
      $($LN_CMD --relative -s $df $f)
		fi
	done
	popd >/dev/null
}

# Problematic to mkdir ../something
(cd .. && mkdir -p .config)

processDirectory ".config" "*"
processDirectory "." ".*"
