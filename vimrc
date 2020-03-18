set nocompatible              " be iMproved, required
filetype off

" ----------------------------------------------------------------------------
"  " Plugins
" ----------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lyuts/vim-rtags'
Plugin 'scrooloose/nerdtree'
"Plugin 'SirVer/ultisnips'
call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------------
"  " Text Formatting
" ----------------------------------------------------------------------------

set tabstop=4		" show existing tab with 4 spaces width
set shiftwidth=4	" when indenting with '>', use 4 spaces width
set expandtab		" On pressing tab, insert 4 spaces
"set paste           " disable automated indentation

" ----------------------------------------------------------------------------
"  Backups
" ----------------------------------------------------------------------------

set nobackup                           " do not keep backups after close
set nowritebackup                      " do not keep a backup while working
set noswapfile                         " don't keep swp files either
set backupdir=$HOME/.vim/backup        " store backups under ~/.vim/backup
set backupcopy=yes                     " keep attributes of original file
set backupskip=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*
set directory=~/.vim/swaps,~/tmp,.      " keep swp files under ~/.vim/swaps

" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
set ruler                   " cord of cursor
set nu                      " display the line number
set relativenumber          " display relative line number
set hlsearch                " highlight matches
set backspace=2             " make backspace work like most other apps
set whichwrap+=<,>,h,l,[,]  " backspace and cursor keys wrap

set shell=zsh
set si
set cursorline
set cursorcolumn
set scrolloff=15
set linespace=6

set guifont=Droid\Sans\Mono:h13
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8

syntax on
color dracula

" ----------------------------------------------------------------------------
"  alerts
" ----------------------------------------------------------------------------
"
set visualbell
set noerrorbells

" ----------------------------------------------------------------------------
"  key map
" ----------------------------------------------------------------------------
inoremap <C-c> <ESC>`^
let mapleader=","
nmap <leader><space> :noh<cr>  

nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

map <C-n> :NERDTreeToggle<CR>

" fix cursor shape under tmux
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" map for clang-format
map <C-K> :pyf /usr/local/opt/llvm/share/clang/clang-format.py<cr>
imap <C-K> <c-o>:pyf /usr/local/opt/llvm/share/clang/clang-format.py<cr>

set autowrite
autocmd BufWritePre * :%s/\s\+$//e
