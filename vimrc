"
" ~/.vimrc
"

set nocompatible

execute pathogen#infect()

"source ~/.vim/noarrows.vim
source ~/.vim/mappings.vim

set fileformats=unix,dos,mac " Use UNIX as main file format
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/swap
set history=256
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

set autochdir   " Auto cd to current file
set autoread    " Auto read external changes

set ruler   " Show cursor position
set showcmd     " Show current command as it is typed
set laststatus=2    " Show statusbar 
set number  " Display line numbers
set wildmenu    " Use autocompletion menu
set wildmode=list:longest,full
set hid     " Hide empty buffers
set vb t_vb="
set noerrorbells " No sounds
set visualbell  " No sounds
set backspace=eol,start,indent " Backspace deletes anything
set whichwrap+=<,>,h,l,[,]  " Move cursor through anything
set shortmess+=I    " Don't display intro message
"if has('mouse')
"  set mouse=a
"endif
set pastetoggle=<F2>
set clipboard=unnamed

"
" *** Tabs and indents
"

filetype indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
"set ai     " Auto indent (indent plugin does this)
"set si     " Smart indent (indent plugin does this)

"
" Wrapping
"

set wrap
set linebreak
set nolist
set textwidth=0

"
" *** Syntax
"

filetype plugin on  " Detect syntax by file extension
syntax on   " Syntax highlighting
set showmatch   " Briefly display bracket pairs
set mat=2   " Display matching brackets for 200ms
"set mps+=<:>   " Match  angle brackets

"
" *** Spelling
"


" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

"
" *** Looks
"

set t_Co=256
colorscheme jellybeans
set cursorline
"set tw=79
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

"
" *** Search
"

set incsearch   " Search as you type
set ignorecase  " Case insensitive search
set smartcase   " Unless search term is in specific case
set gdefault    " g/ flag for replace by default
set hlsearch!   " Don't highlight anything until searched

