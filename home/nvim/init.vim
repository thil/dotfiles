" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set ruler                       "Show cursor positions
set hlsearch                    "Highlight search
set incsearch                   "Incremental search

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

call plug#begin("~/.vim/plugged")
  " Theme
  Plug 'sonph/onehalf', { 'rtp': 'vim' }

  " Language Client
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

  " TypeScript Highlighting
  Plug 'leafgarland/typescript-vim'

  " File Explorer with Icons
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " File Search
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/tComment'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'skwp/YankRing.vim'

  " Git
  Plug 'tpope/vim-fugitive'

  Plug 'skwp/vim-easymotion'
call plug#end()

" Enable theming support
if (has("termguicolors"))
 set termguicolors
endif

" System Settings  ----------------------------------------------------------{{{
set guifont=Hack\ Nerd\ Font\ Mono
set encoding=utf8

set noshowmode
set noswapfile
filetype on
set relativenumber number
set tabstop=2 shiftwidth=2 expandtab
set conceallevel=0

" Theme
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
map <leader>d :NERDTreeToggle<cr>
map <leader>e :NERDTreeFind<cr>

" === FZF settings
nnoremap <leader>t :Files<CR>
nnoremap <leader>g :Commits<CR>
nnoremap <leader>f :Lines<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
" requires silversearcher-ag
" used to ignore gitignore files
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
autocmd FileType fzf tnoremap <buffer> <C-j> <Down>
autocmd FileType fzf tnoremap <buffer> <C-k> <Up>

" open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on ctrl+;
" uses zsh instead of bash
function! OpenTerminal()
  split term://fish
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


" Copy to osx clipboard
vnoremap <C-c> "*y<CR>

" Align blocks of text and keep them selected
vmap < <gv
vmap > >gv

map <esc> :noh<cr>

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1


"
" ================ Status Line ======================
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c

" ==== TComment seetings
map <leader>c<Space> :TComment<CR>

"===== Indent guids
let g:indent_guides_enable_on_vim_startup = 1

"===== Yankring
let g:yankring_history_file = '.yankring-history'
nnoremap ,yr :YRShow<CR>
nnoremap C-y :YRShow<CR>

" Switch between the last two files
nnoremap <leader>z <c-^>

" Ag
nmap <leader>ag :Ag <Left>
nnoremap <leader>as :Ag! <C-r>=expand('<cword>')<CR><CR>
