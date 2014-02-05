set guifont=Monospace\ 9
" Generic
set autoread
set nocompatible
set wrapscan
set mouse=a

" Bundle
set rtp+=~/.vim/bundle/vundle
call vundle#rc()


Bundle 'gmarik/vundle'

Bundle 'dag/vim-fish'
Bundle 'elzr/vim-json'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'bling/vim-airline'
Bundle 'nanotech/jellybeans.vim'

" Plugin specific settings
let g:ctrlp_use_caching = 1

" Encoding
scriptencoding utf-8
set encoding=utf-8

" Display
syntax on
colorscheme jellybeans
set modelines=5
set title
set wrap
set linebreak
set cursorline
set visualbell
set laststatus=2
set scrolloff=5
set colorcolumn=80
set tw=79

" Indentation
filetype plugin indent on
set autoindent
set smartindent
set smarttab
set expandtab
set shiftwidth=3
set softtabstop=3
set tabstop=3

" Trailings
set list
set listchars=trail:·,tab:▸\

" Show
set showmode
set showcmd
set title
set wildmenu
set visualbell
set number
set ruler

" Search
set ignorecase
set hlsearch
set smartcase
set incsearch

" Mutt
au BufRead /tmp/mutt-* set tw=72
au BufRead /tmp/mutt-* set nohlsearch
au BufRead /tmp/mutt-* setlocal spell spelllang=en_us

" Folding
if has ('folding')
  set foldenable
  set foldmethod=syntax
  "set foldmethod=marker
  "set foldmarker={{{,}}}
  set foldcolumn=0
endif

" Commands
set pastetoggle=<F5>                  " Copy and paste
nmap <silent> <F2> g<C-g>             " Word count
nnoremap <silent> <C-l> :noh<CR><C-l> " Redraw and clear hlsearch.
nmap  <F3> :%s/_\([a-z]\)/\u\1/gc     " camelCase
" :retab - fix all old tabs/space errors
" ^Y scroll buffer up
" ^E scroll buffer down
" :sh to go to shell; ^D to go back
