# Avoids having to use escape codes
autoload colors && colors

export PS1="%m:%1~ %B%{$fg[green]%}$%{$reset_color%}%b " 

# zsh seems to default to vi, perhaps because thats the configured editor
set -o emacs

. ~/dotfiles/common_startup
