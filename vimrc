" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" General Override of Defaults
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set exrc
set secure
set wildmenu
set ttyfast

" Show the title, ruler, status, mode, and absolute line numbers
set showmode
set showcmd
set title
set ruler
" set relativenumber
set number
set hidden
set colorcolumn=80,100

" This is what files look like
set encoding=utf8
set ffs=unix,dos,mac

" From whence you came, you shall remain, until you set, the path again
set path=$PWD/**

" Tab sanity
set autoindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set backspace+=start,eol,indent

" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" No backups
set autoread
set nobackup
set nowritebackup
set nowb
set noswapfile

" Keep lots of history/undo
set history=1000
set undolevels=1000

" Use filetype in lieu of compatible if available
if has("autocmd")
    filetype on
    filetype indent on
    filetype plugin on
    set nocompatible
endif

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin Installation
"  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Set up Vundle on first install - Vundle, in turn, installs all other plugins
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" List bundles here
" ~~~~~~~~~~~~~~~~~

" General
Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
" Python + Theme (molokai)
Plugin 'pfdevilliers/Pretty-Vim-Python'
" JavaScript
Plugin 'pangloss/vim-javascript'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" end of vundle setup

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin Configuration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Syntastic Configuration
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Syntax highlighting
syntax enable

" Colorscheme
set t_Co=256
colorscheme molokai
