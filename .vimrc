call pathogen#infect()
call pathogen#helptags()
"
" Source host specific vimrc file
let hostfile=expand('~/dotfiles/vimrc-' . hostname())
if filereadable(hostfile)
	execute 'source ' . hostfile
endif

set nocompatible
syntax enable
set background=dark
set cursorline
set number
set relativenumber
set hidden
set showcmd " Show partial commands
set scrolloff=3
set laststatus=2 " Display status line even if only one window
set nobackup
set noswapfile
au CursorHold * checktime " Check if file changed on idle
set updatetime=2000 " Reduce the updatetime from 4s to 2s which affect checktime above
hi CursorLine ctermbg=235  guibg=white cterm=NONE
colorscheme grb256
set hls is
highlight Search gui=underline term=underline

augroup tabsettings
	au!
	filetype plugin indent on
	autocmd FileType c setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType cpp setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType cuda setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType objc setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType objcpp setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType html setlocal ts=2 sw=2 expandtab
	autocmd FileType matlab setlocal commentstring=\%%s ts=4 sts=4 sw=4 expandtab
augroup END

augroup filetypes
	au!
	au BufEnter *.h let b:fswitchdst  = 'cpp,t'
	au BufEnter *.t let b:fswitchdst  = 'h'
	au BufEnter *.cu let b:fswitchdst  = 'h'
	au BufNewFile,BufRead *.t set filetype=cpp
augroup END

augroup arduino
	au BufNewFile,BufRead *.ino set filetype=c
augroup END

set autowrite " Automatically save before building
set grepprg=ack
nmap <Leader>d <C-]>

"
" Customizations of stock vim
"

" Use kk or as <Esc> in insert mode
inoremap kk <Esc>
inoremap å <Esc>
inoremap <Esc> <Nop>
inoremap <C-\> <Esc>:wq<cr>
nnoremap <C-\> :wq<cr>

" Split navigation
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>

vnoremap . :normal .<cr>

"
" Other
"

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

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
	try
		silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
	catch /Vim:Interrupt/
" Swallow the ^C so that the redraw below
" happens; otherwise there will be
" leftovers from selecta on the screen
		redraw!
		return
	endtry
	redraw!
	exec a:vim_command . " " . selection
endfunction

nnoremap <silent> <Leader>f :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

let g:CommandTMaxFiles=60000

" Fuzzy Recursive file search on <leader>t
" nnoremap <leader>t :<C-u>Unite -start-insert file_rec<CR>

" Update tags file
nnoremap <leader>ut :make tags<cr>

"
" Quickly open files
"
" Open .vimrc in split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source .vimrc
nnoremap <leader>sv :wa<cr>:source $MYVIMRC<cr>
" Edit TODO in split
nnoremap <leader>et :vsplit TODO<cr>
" Edit common_startup
nnoremap <leader>eb :vsplit ~/dotfiles/common_startup<cr>

" Current objective C method including newline below
onoremap am :execute ":normal ?^[+-]\rv/^}/+1\r"<cr>
" Current objective C @int../imp to @end block
onoremap ai :execute ":normal ?^@i\rV/^@end\r"<cr>

" Current block between #, e.g. #if - #endif
onoremap a# :execute ":normal ?^#\rV/^#\r"<cr>

:function! ObjCCurrentClass()
:	execute "normal! ?@imple\<cr>"
:	normal! "myy
:	return @m
:endfunction

noremap <leader>cr :call ObjCCurrentClass()<cr>

" Change ending { into ;
nnoremap <leader>ä :execute ":s/ \*{/;"<cr>

" Add #import for word under cursor
nnoremap <leader>i mzyiwggO#import "<esc>pa.h"<esc>`z

" Surround visual selection with #if 0 #endif
nnoremap gc# '<O#if 0<esc>'>oendif<esc>

iabbrev aia alloc] init] autorelease]

" Ignore lines that looks like they start with a year
" set errorformat^=%-G20%.%.-%.%#
" Ignore lines starting with Test Suite
" set errorformat^=%-GTest\ Suite%s
"set errorformat=%+G%.%#bar%.%#

" Use a restrictive errorformat since it easily thinks that times (e.g.
" 20:00:00) is a filename:line:column otherwise.
set errorformat=%f(%l):\ %trror:\ %m,%f(%l):\ %tarning:\ %m,%f:%l:%c:\ %tarning:\ %m,%f:%l:%c:\ error:\ %m,%f:%l:\ error:\ %m,%f:%l:%c:\ fatal\ error:\ %m
" Support for error messages prefixed with build.bat from EBS
set errorformat+=,build.bat:%*\\s%*\\d>%f(%l):\ %trror\ %m
" As above but allow for ____123> inserted by Incredibuild before the filename
set errorformat+=,build.bat:%f(%l):%*\\s%trror\ %m

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


" Open tool sharpening list
" nnoremap <leader>es :vsplit ~/Documents/toolSharpening.txt<cr>
nnoremap <leader>es :vsplit ~/docs/toolSharpening.txt<cr>
" Edit work_startup
nnoremap <leader>ew :vsplit ~/dotfiles/work_startup<cr>

"
" Vim airline
"
" let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing' ]
let g:airline#extensions#whitespace#checks = []
