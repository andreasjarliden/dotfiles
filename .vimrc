call pathogen#infect()
set nocompatible
syntax enable
set background=dark
colorscheme solarized
set hls is
highlight Search gui=underline term=underline
if has("autocmd")
	filetype plugin indent on
	autocmd FileType objc setlocal ts=4 sts=4 sw=4 expandtab
endif
