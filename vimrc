" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" General Override of Defaults
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
set ttyfast
set showmode
set showcmd
set title
set number
set hidden

" This is what files look like
set ffs=unix,dos,mac

" Update find path to search subdirectories
set path=$PWD/**

" No backups
set nobackup
set nowritebackup
set nowb
set noswapfile

" Keep lots of history/undo
set undolevels=1000

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
inoremap jk <Esc>

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" Plugin Installation
"  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Set up Vundle on first install - Vundle, in turn, installs all other plugins
set exrc
set secure

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
Plugin 'tpope/vim-sensible'
" Python + Theme (molokai)
Plugin 'sentientmachine/Pretty-Vim-Python'
" JavaScript
Plugin 'jelera/vim-javascript-syntax'
" CSS and SCSS
Plugin 'cakebaker/scss-syntax.vim'
" Asynchronous Lint Engine
Plugin 'dense-analysis/ale'


if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif
" end of vundle setup

" Colorscheme
set t_Co=256
colorscheme molokai

set colorcolumn=80,100

highlight ColorColumn ctermbg=238 guibg=#232728

" Tab sanity
set expandtab
set tabstop=4
set shiftwidth=4

" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" Different tab/space stops"
autocmd Filetype yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype json setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
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
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'python': ['black', 'isort'],
\   'scss': ['prettier'],
\   'yaml': ['prettier'],
\}
let g:ale_linters = {
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'less': ['prettier'],
\   'python': ['flake8'],
\   'scss': ['prettier'],
\   'yaml': ['prettier'],
\}
let g:ale_fix_on_save = 1
