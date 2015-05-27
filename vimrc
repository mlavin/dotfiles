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
set relativenumber
set number
set hidden

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

" Syntax highlighting
syntax enable

" Colorscheme
set t_Co=256
colorscheme github
