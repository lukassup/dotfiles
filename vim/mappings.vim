
command Q q! " :Q=:q!

" Sudo save
command W w !sudo tee % > /dev/null

" Moving along wrapped lines properly
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap OB gj
nnoremap OA gk
vnoremap OB gj
vnoremap OA gk


" Toggle highlight
nnoremap <F3> :set hlsearch!<CR>

" Quick pairs
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i

" Ctrl+Z quick save in any mode
noremap <C-Z> :update<CR>
inoremap <C-Z> <C-O>:update<CR>
vnoremap <C-Z> <C-C>:update<CR>

nnoremap <Space> /
