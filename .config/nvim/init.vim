set nocompatible

call plug#begin()
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'joshdick/onedark.vim'
    Plug 'itchyny/lightline.vim'
call plug#end()

set encoding=utf-8
set termguicolors
set number
set mouse=a

set tabstop=8 
set softtabstop=0 
set expandtab 
set shiftwidth=4 
set smarttab

set hlsearch
set incsearch
set ignorecase
set smartcase

let g:lightline = {'colorscheme': 'onedark',}
let g:onedark_terminal_italics=1

filetype plugin indent on
syntax on
colorscheme onedark
