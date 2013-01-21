call pathogen#infect()
set nocompatible
syntax enable
set background=dark
set cursorline
set showcmd " Show partial commands
set laststatus=2 " Display status line even if only one window
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
hi CursorLine ctermbg=white guibg=white
colorscheme solarized
set hls is
highlight Search gui=underline term=underline
if has("autocmd")
	filetype plugin indent on
	autocmd FileType objc setlocal ts=4 sts=4 sw=4 expandtab
endif
