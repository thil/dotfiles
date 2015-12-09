filetype off

set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/vundles/ "Submodules

runtime appearance.vundle
runtime extra.vundle
runtime git.vundle
runtime search.vundle
runtime language.vundle

" Add plugins to &runtimepath
call plug#end()
