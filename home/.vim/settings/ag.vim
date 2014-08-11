nmap <leader>ag :Ag ""<Left>
nmap <leader>af :AgFile ""<Left>

nnoremap <leader>as :Ag! "<C-r>=expand('<cword>')<CR>"<CR>
" Ag for the last search.
nnoremap <silent> <leader>ap :execute "Ag! '" . substitute(substitute(substitute(@/, "\\\\<", "\\\\b", ""), "\\\\>", "\\\\b", ""), "\\\\v", "", "") . "'"<CR>
