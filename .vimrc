let mapleader = 'ö'
call pathogen#infect()
call pathogen#helptags()
set nocompatible
syntax enable
set background=dark
set cursorline
set number
set hidden
set showcmd " Show partial commands
set laststatus=2 " Display status line even if only one window
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
set nobackup
set noswapfile
au CursorHold * checktime " Check if file changed on idle
set updatetime=2000 " Reduce the updatetime from 4s to 2s which affect checktime above
hi CursorLine ctermbg=white guibg=white
colorscheme grb256
set hls is
highlight Search gui=underline term=underline
augroup tabsettings
	au!
	filetype plugin indent on
	autocmd FileType objc setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType html setlocal ts=2 sw=2 expandtab
augroup END

augroup alternateobjc
	au!
	au BufEnter *.h let b:fswitchdst  = 'm,mm'
	au BufNewFile *.h set filetype=objc
	au BufNewFile *.m set filetype=objc
augroup END

set autowrite " Automatically save before building
set grepprg=ack
nmap <Leader>d <C-]>

" Use kk as <Esc> in insert mode
inoremap kk <Esc>
inoremap <Esc> <Nop>

" Split navigation
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>

" Alternate File (Header <> Impl file)
noremap <leader>a :FSHere<cr>

" Previous buffer
nnoremap <leader>p :b#<cr>

" Show invisible characters
set list
set listchars=tab:»·,trail:·

" Recompile
nnoremap <leader>r :wa<cr>:Make<Up><cr>
" Save All
nnoremap <leader>s :wa<cr>
" Open .vimrc in split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source .vimrc
nnoremap <leader>sv :wa<cr>:source $MYVIMRC<cr>
nnoremap <leader>es :vsplit ~/Documents/toolSharpening.txt<cr>
" Edit TODO in split
nnoremap <leader>et :vsplit TODO<cr>

" Current objective C method including newline below
onoremap am :execute ":normal ?^[+-]\rv/^}/+1\r"<cr>
" Current objective C @int../imp to @end block
onoremap ai :execute ":normal ?^@i\rv/^@end\r"<cr>

" Current block between #, e.g. #if - #endif
onoremap a# :execute ":normal ?^#\rV/^#\r"<cr>

:function! ObjCCurrentClass()
:	execute "normal! ?@imple\<cr>"
:	normal! "myy
:	return @m
:endfunction

noremap <leader>cr :call ObjCCurrentClass()<cr>

iabbrev aia alloc] init] autorelease]

" Ignore lines that looks like they start with a year
" set errorformat^=%-G20%.%.-%.%#
" Ignore lines starting with Test Suite
" set errorformat^=%-GTest\ Suite%s
"set errorformat=%+G%.%#bar%.%#

" Use a restrictive errorformat since it easily thinks that times (e.g.
" 20:00:00) is a filename:line:column otherwise.
set errorformat=%f:%l:%c:\ error:\ %m,%f:%l:\ error:\ %m,%f:%l:%c:\ fatal\ error:\ %m

