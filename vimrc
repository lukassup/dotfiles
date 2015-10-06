"
" ~/.vimrc
"

set nocompatible

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

"
" *** Tabs and indents
"

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

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

syntax on       " Syntax highlighting
set showmatch   " Briefly display bracket pairs
set mat=2       " Display matching brackets for 200ms
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

"set cursorline
set background=dark
"colorscheme jellybeans
"let &colorcolumn="80,".join(range(120,999),",")
"highlight ColorColumn ctermbg=DarkGrey guibg=DarkGrey
"highlight CursorLine term=NONE cterm=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight LineNr term=NONE cterm=NONE ctermfg=DarkGrey
"highlight CursorLineNr term=bold cterm=NONE ctermfg=White

"
" *** Status line
"

set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"filename tail
"file encoding
"file format
"help file flag
"modified flag
"read only flag
"filetype
"left/right separator
"cursor column
"cursor line/total lines
"percent through file

"
" *** Search
"

set incsearch   " Search as you type
set ignorecase  " Case insensitive search
set smartcase   " Unless search term is in specific case
set gdefault    " g/ flag for replace by default
set hlsearch!   " Don't highlight anything until searched

"
" *** Advanced
"

if has('mouse')
    set mouse=a
endif

" Use X clipboard if supported
if has('xterm_clipboard')
    set clipboard=unnamedplus
elseif has('clipboard')
    set clipboard=unnamed
endif

set pastetoggle=<F2>

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

endif " has("autocmd")

