" Fold based off indent with 10 max inner folds.
set foldmethod=indent
set foldnestmax=10

if &shell =~# 'fish$'
    set shell=bash
endif

" Disable Background Color Erase (BCE) so that color schemes work
" properly within 256-color terminals
set t_ut=

set guifont=Monospace\ 9
" Generic
set confirm "Save on exit.
set autoread
set nocompatible
set wrapscan
set mouse=a

"Ignore directories
set wildignore+=*venv*,*.pyc,__pycache__,*.swp,*.so,*.zip

" Backups
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'wlangstroth/vim-racket'
Plug 'ludovicchabant/vim-gutentags'
Plug 'hynek/vim-python-pep8-indent'
Plug 'mfukar/robotframework-vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'w0ng/vim-hybrid'
Plug 'dag/vim-fish'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'ompugao/vim-airline-datetime'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/TagHighlight'
Plug 'vim-scripts/a.vim'
Plug 'vim-scripts/python.vim'
call plug#end()

" Plugin specific settings
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:solarized_termcolors=256
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_use_caching = 1
let g:ctrlp_custom_ignore = {
   \ 'dir': '\v[\/]\.(git|hg|svn)$',
   \ 'file': 'build\|tags\|\.class\|\.o\|\.d\|\.pyc\|\v\.(exe|so|dll)$',
   \ }

" Encoding
scriptencoding utf-8
set encoding=utf-8

" Display
syntax enable
set t_Co=256
set background=dark
colorscheme solarized
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

" Autocmds
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
" Remove trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Binds
" Copy and paste
set pastetoggle=<F5>
" Word count
nmap <silent> <F2> g<C-g>
" Redraw and clear highlights.
nnoremap <silent> <C-l> :noh<CR><C-l>
" Underscores to camelCase.
nmap <F3> :%s/_\([a-z]\)/\u\1/gc
" Strip trailing whitespace, returns and .
nmap <F4> :%s/\s\+$\\|\r\\|\%u2936//g
nnoremap <leader><space> :NERDTreeToggle<CR> :set number<CR> <cl>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>u :UpdateTypesFile<cr>
" Reload file using \r.
nnoremap <leader>r :e<cr>

" Fugitive git bindings.
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gD :vsplit<CR> :Git! diff --staged<CR>
nnoremap <space>gg :Ggrep<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gpu :Gpush<CR>
nnoremap <space>gpl :Gpull<CR>
