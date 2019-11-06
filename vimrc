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
set laststatus=2

" This is what files look like
set encoding=utf-8
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

" Files to ignore
" Python
set wildignore+=*.pyc,*.pyo,*/__pycache__/*
" Erlang
set wildignore+=*.beam
" Temp files
set wildignore+=*.swp,~*
" Archives
set wildignore+=*.zip,*.tar

" Remap escape
imap jk <Esc>

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
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
" Python + Theme (molokai)
Plugin 'pfdevilliers/Pretty-Vim-Python'
" JavaScript
Plugin 'jelera/vim-javascript-syntax'
" Asynchronous Lint Engine
Plugin 'dense-analysis/ale'


if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" end of vundle setup

" Syntax highlighting
syntax enable

" Colorscheme
set t_Co=256
colorscheme molokai

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Color overrides
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
highlight WarnHighlight ctermbg=red guibg=red
highlight ColorColumn ctermbg=238 guibg=#232728

" Highlight trailing whitspace
autocmd BufWinEnter * match WarnHighlight /\s\+$/
autocmd InsertEnter * match WarnHighlight /\s\+\%#\@<!$/
autocmd InsertLeave * match WarnHighlight /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make setlocal noexpandtab

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin Configuration
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" ALE Configuration
let g:ale_fixers = {
\    '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\}
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1
