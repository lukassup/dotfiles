"
" ~/.vimrc
"

" This must be set first!
set nocompatible        " Use Vim settings instead of Vi. 

"
" *** Source files
"

"source $HOME/.vim/noarrows.vim
source $HOME/.vim/mappings.vim

"
" *** Files, Formats, History & Backup
"

"set autochdir           " Auto cd to current file
set autoread            " Auto read external changes
set history=256
set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set backupdir=$HOME/.vim/backup
set undodir=$HOME/.vim/undo
set directory=$HOME/.vim/swap
set fileformats=unix,dos,mac

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
endif

if has("vms")
    set nobackup            " Do not keep a backup file, use versions instead
else
    set backup              " Keep a backup file (restore to previous version)
    set undofile            " Keep an undo file (undo changes after closing)
endif

"
" *** Tabs and Indents
"

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

"
" *** Wrapping & Editing behavior
"
"
set wrap
set linebreak
" Display invisible characters.
" Use the same symbols as TextMate for tabstops and EOLs
if &termencoding == "utf-8"
    set listchars=tab:▸\ ,eol:¬
else
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
endif

set nolist
set textwidth=0
set hidden                  " Hide empty buffers instead of closing
set backspace=indent,eol,start " Backspace over everything in insert mode
set whichwrap+=<,>,h,l,[,]  " Move cursor through anything

"
" *** Syntax & Looks
"

set shortmess+=I        " Don't display intro message

syntax on               " Syntax highlighting
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
set background=dark
set t_Co=16             " Use 16 color mode for performance
let &colorcolumn="80,".join(range(120,999),",")

set ruler               " Show cursor position
set showcmd             " Show current command as it is typed
set laststatus=2        " Show statusbar 
set showmatch           " Briefly display bracket pairs
set number              " Display line numbers
set mat=2               " Display matching brackets for 200ms
"set mps+=<:>           " Match  angle brackets
set cursorline
set vb t_vb="
set noerrorbells        " No sounds & bells
set visualbell          " No sounds & bells
set wildmenu            " Use autocompletion menu
set wildmode=list:longest,full

"
" *** Status line
"

set statusline=%t       " Filename
set statusline+=%m      " Modified flag
set statusline+=%r      " Read-only flag
set statusline+=[%c,%l/%L] " File position [column, line/total]
set statusline+=[%P]    " Percent in file
set statusline+=%h      " Help section
set statusline+=%=      " Separator
set statusline+=%y      " File syntax
set statusline+=[%{strlen(&fenc)?&fenc:'none'},%{&ff}] " File enconding & line endings

"
" *** Search
"

set incsearch           " Search as you type
set ignorecase          " Case insensitive search
set smartcase           " Unless search term is in specific case
set gdefault            " g/ flag for replace by default
set hlsearch!           " Don't highlight anything until searched

"
" *** Spelling
"

if version >= 700
    set spl=en spell     " Use english for spellchecking
    set nospell          " don't spellcheck by default
endif

"
" *** Advanced
"

if has('mouse')
    set mouse=a         " Turn on mouse if supported
endif


if has('xterm_clipboard')
    set clipboard=unnamedplus " Use X clipboard if supported
elseif has('clipboard')
    set clipboard=unnamed
endif

set pastetoggle=<F2> " Toggle paste mode

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
"inoremap <C-U> <C-G>u<C-U>

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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif
