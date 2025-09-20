-- Tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Cursor style
vim.cmd("set cursorline")
vim.cmd("set number")
vim.cmd("set relativenumber")

-- Use space as leader
vim.g.mapleader = " "

-- Use kk as <Esc> in insert mode
vim.cmd("inoremap kk <Esc>")

-- Split navigation
vim.cmd("noremap <C-h> <C-w><C-h>")
vim.cmd("noremap <C-j> <C-w><C-j>")
vim.cmd("noremap <C-k> <C-w><C-k>")
vim.cmd("noremap <C-l> <C-w><C-l>")

-- Let . work on each line in visual mode
vim.cmd("xnoremap . :normal .<CR>")
