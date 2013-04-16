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
if has("autocmd")
	filetype plugin indent on
	autocmd FileType objc setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
endif

augroup alternateobjc
	au!
	au BufEnter *.h let b:fswitchdst  = 'm,mm'
augroup END

set autowrite " Automatically save before building
set makeprg=xcodebuild
set grepprg=ack
nmap <Leader>b :make -workspace Caliander.xcworkspace -scheme AcceptanceTests<CR>
nmap <Leader>u :make -workspace Caliander.xcworkspace -scheme AcceptanceTests TEST_AFTER_BUILD=YES<CR>
nmap <Leader>m :make -workspace Caliander.xcworkspace -scheme "Caliander App" test<CR>
nmap <Leader>d <C-]>

" Split navigation
noremap <C-h> <C-w><C-h>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-l> <C-w><C-l>

" Show invisible characters
set list
set listchars=tab:»·,trail:·

" Open .vimrc in split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Current objective C method including newline below
onoremap am :execute ":normal ?^[+-]\rv/^}/+1\r"<cr>
