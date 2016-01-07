
command Q q! " :Q=:q!

" Sudo save
command W w !sudo tee % > /dev/null

" Moving along wrapped lines properly
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
"noremap  <Home> g<Home>
"noremap  <End> g<End>
"noremap  0 g0
"noremap  $ g$

" Proper movement even in insert mode
" might break stuff!

"inoremap <Up> <C-o>gk
"inoremap <Down> <C-o>gj
"inoremap <Home> <C-o>g<Home>
"inoremap <End> <C-o>g<End>

" Toggle highlight
nnoremap <F3> :set hlsearch!<CR>
" Toggle NERDTree
nnoremap <F4> :NERDTreeToggle<CR>

" Quick pairs
"imap <leader>' ''<ESC>i
"imap <leader>" ""<ESC>i
"imap <leader>( ()<ESC>i
"imap <leader>[ []<ESC>i
"imap <leader>{ {}<ESC>i
"imap <leader>< <><ESC>i

" Ctrl+Z quick save in any mode
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Map forward search to SPACE
nnoremap <Space> /
