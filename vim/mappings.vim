
command Q q! " :Q=:q!

" Sudo save
command W w !sudo tee % > /dev/null

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
