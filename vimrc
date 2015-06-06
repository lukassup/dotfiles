"
" ~/.vimrc
"
execute pathogen#infect()
"source ~/.vim/noarrows.vim
source ~/.vim/mappings.vim
"
" GENERAL
"

filetype plugin on
filetype indent on

set fileformats=unix,dos,mac
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

set ruler
set showcmd
set autochdir
set nocompatible
set autoread
set hid
set history=512

set pastetoggle=<F2>
set clipboard=unnamed

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Disable sounds
set vb t_vb="
set noerrorbells
set visualbell

" Completion menu instead of instant completion
set wildmenu
set wildmode=list:longest,full
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

set backupdir=$HOME/.vimbackup
set directory=$HOME/.vimswap

"if has('mouse')
"  set mouse=a
"endif

"
" TAB BEHAVIOR
"

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
"set ai " Auto indent
"set si " Smart indent

set nowrap
"set linebreak
"set nolist
set fo-=t
"set wm=0

"
" SYNTAX
"

syntax on
set nu
set showmatch
set mat=2
" Match  angle brackets
"set mps+=<:>

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

"
" LOOKS
"

set t_Co=256
color molokai
let g:molokai_original = 1
"highlight ColorColumn ctermbg=Gray
"set colorcolumn=81
"set foldcolumn=1
"set background=dark
set cursorline
set tw=79
set colorcolumn=80
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

"
" SEARCH
"

" While typing a search command, show immediately where the
" so far typed pattern matches.
set incsearch
set ignorecase
set smartcase
set gdefault
set hlsearch!

set shortmess+=I

