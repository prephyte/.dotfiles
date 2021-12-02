set nocp
filetype off
syntax enable
filetype plugin indent on
set number
set ruler
set encoding=utf-8
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
set hidden
set ttyfast
set laststatus=2
set showmode
set showcmd
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
set t_Co=256
set background=dark
colorscheme monokai
set mouse=a
