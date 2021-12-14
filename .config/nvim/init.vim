set nocompatible
filetype off

call plug#begin()
    Plug 'sheerun/vim-polyglot'
    Plug 'preservim/nerdtree'
    Plug 'joshdick/onedark.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'python-mode/python-mode'
    Plug 'neoclide/coc.nvim'
    Plug 'davidhalter/jedi-vim'
    Plug 'mitsuhiko/vim-jinja'
    Plug 'mitsuhiko/vim-python-combined' 
    Plug 'rosenfeld/conque-term'
    Plug 'tpope/vim-surround'
    Plug 'moll/vim-bbye'
call plug#end()

set encoding=utf-8
set termguicolors
set noshowmode
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

filetype plugin indent on
syntax on
colorscheme onedark

cmap wsu w !sudo tee > /dev/null %
cmap bq Bdelete

" NERDTree autostart and keybinds
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
nnoremap <C-b> :NERDTreeToggle<CR>


" Vim airline icons
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' '
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.colnr = ' - '
let g:airline_symbols.dirty='⚡'
let g:airline_theme = 'onedark'

let g:onedark_terminal_italics = 1
