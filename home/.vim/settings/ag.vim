nmap <leader>ag :Ag ""<Left>
nmap <leader>af :AgFile ""<Left>

nnoremap <leader>as :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Ag for the last search.
nnoremap <silent> <leader>ap :execute "Ag! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>
