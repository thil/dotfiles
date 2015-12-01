nnoremap <Leader>x :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
" let g:rspec_command = "!docker-compose run web bundle exec rspec {spec}"
let g:rspec_command = "!bundle exec rspec {spec}"
