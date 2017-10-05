set foldmethod=indent
set foldnestmax=10

if &shell =~# 'fish$'
    set shell=bash
endif
set t_ut=

set guifont=Monospace\ 9
" Generic
set confirm "Save on exit.
set autoread
set nocompatible
set wrapscan
set mouse=a

"Ignore directories
set wildignore+=*venv*
set wildignore+=*.pyc
set wildignore+=__pycache__

" Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/TagHighlight'
Plug 'kien/rainbow_parentheses.vim'
Plug 'wlangstroth/vim-racket'
Plug 'ludovicchabant/vim-gutentags'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mfukar/robotframework-vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/python.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0ng/vim-hybrid'
Plug 'dag/vim-fish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'nanotech/jellybeans.vim'
call plug#end()

" Plugin specific settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = {
   \ 'dir': '\v[\/]\.(git|hg|svn)$',
   \ 'file': '\.o\|\.d\|\.pyc\|\v\.(exe|so|dll)$',
   \ }

" Encoding
scriptencoding utf-8
set encoding=utf-8

" Display
syntax enable
set t_Co=256
set background=dark
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
"set smartindent
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

" Commands
set pastetoggle=<F5>                  " Copy and paste
nmap <silent> <F2> g<C-g>             " Word count
nnoremap <silent> <C-l> :noh<CR><C-l> " Redraw and clear hlsearch.
nmap <F3> :%s/_\([a-z]\)/\u\1/gc      " camelCase
nmap <F4> :%s/\s\+$\\|\r\\|\%u2936//g   " Strip whitespace, returns and ⤶.
" :retab - fix all old tabs/space errors
" ^Y scroll buffer up
" ^E scroll buffer down
" :sh to go to shell; ^D to go back
" gg=G reset tab settings
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
" Toggle nerdtree.
nnoremap <C-n> :NERDTreeToggle<CR>
