filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/ "Submodules
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

runtime appearance.vundle
runtime extra.vundle
runtime git.vundle
runtime search.vundle
runtime language.vundle

"Filetype plugin indent on is required by vundle
filetype plugin indent on
