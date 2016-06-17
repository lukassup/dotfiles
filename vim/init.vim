""
"   ~/.vim/init.vim
"

source $HOME/.vim/mappings.vim
"source $HOME/.vim/noarrows.vim

"
" *** Plugins
"

" mkdir -p ~/.vim/autoload
" curl -Ss https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o ~/.vim/autoload/plug.vim

call plug#begin('~/.vim/plugged')
Plug 'w0ng/vim-hybrid'
"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'ervandew/supertab'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'scrooloose/syntastic'
"Plug 'davidhalter/jedi-vim'
"Plug 'nvie/vim-flake8', { 'for': 'python' }
"Plug 'vim-latex/vim-latex', { 'for': 'latex' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'michaeljsmith/vim-indent-object'
Plug 'honza/dockerfile.vim'
Plug 'git://fedorapeople.org/home/fedora/wwoods/public_git/vim-scripts.git'
call plug#end()

" Theme + Airline
" 16 colors (use term palette)
let &t_Co = 16
let g:hybrid_custom_term_colors = 1
"let g:airline_theme='term'
set background=dark
colorscheme hybrid

" IndentLine
let g:indentLine_color_tty_light = 7
let g:indentLine_color_dark = 1

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"
" *** Files, Formats, History & Backup
"

set wildignore=.svn,CVS,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif
set backupdir=$HOME/.vim/backup
set undodir=$HOME/.vim/undo
set directory=$HOME/.vim/swap
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

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
set expandtab

"
" *** Wrapping & Editing behavior
"

set wrap
set linebreak
" Display invisible characters.
" Use the same symbols as TextMate for tabstops and EOLs
if &encoding == "utf-8"
    set listchars=tab:▸\ ,eol:¬,trail:·
else
    set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
endif

set nolist
set textwidth=0
set hidden                  " Hide empty buffers instead of closing
set whichwrap+=<,>,h,l,[,]  " Move cursor through anything

"
" *** Syntax & Looks
"

set shortmess+=I        " Don't display intro message
syntax on               " Syntax highlighting
"let &colorcolumn = "80,".join(range(120,999),",")
let &colorcolumn = 80
set ruler               " Show cursor position
set showcmd             " Show current command as it is typed
set showmatch           " Briefly display bracket pairs
set number              " Display line numbers
set mat=2               " Display matching brackets for 200ms
"set mps+=<:>           " Match  angle brackets
set cursorline
set vb t_vb="
set noerrorbells        " No sounds & bells
set visualbell          " No sounds & bells
set wildmode=list:longest,full

"
" *** Status line
"

set statusline=%t
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*\ 
set statusline+=%m
set statusline+=%r
set statusline+=%h
set statusline+=%w
set statusline+=%y
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=[
set statusline+=%{strlen(&spl)?&spl:''},
set statusline+=%{&ff},
set statusline+=%{strlen(&fenc)?&fenc:'none'}
set statusline+=]
set statusline+=[%c,%l/%L\ %P]

"
" *** Search
"

set ignorecase          " Case insensitive search
set smartcase           " Unless search term is in specific case
set gdefault            " g/ flag for replace by default

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

set foldmethod=indent
set foldlevel=99
set clipboard+=unnamedplus " Use X clipboard
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

    " Remember cursor position per file position
    autocmd BufReadPost *
        \ if line("'\"") >= 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif

    augroup END

else
    set autoindent
endif

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
