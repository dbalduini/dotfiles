set nocompatible        " be iMproved, required
filetype off            " required

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Colors
Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========================================================================
" Plugin setup
" ========================================================================

"  Syntax
syntax on
set background=dark
colorscheme solarized

set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" Nerdtree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>

" Powerline setup
" set guifont=Inconsolata\ for\ Powerline:h15
set guifont=Fira\ Mono\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set laststatus=2

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=tmp/** " Ignore stuff that can't be opened

" The Silver Searcher
if executable('ag')
  " use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " use ag in CtrlP for listing files. Faster and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_user_command = 'find %s -type f'
endif

" Syntastic
let g:syntastic_check_on_open = 0
" aggregate list of checkers
let g:syntastic_aggregate_errors = 1
" enable js linters
let g:syntastic_javascript_checkers=['jshint', 'jscs']

" ========================================================================
" Config
" ========================================================================

" change the mapleader from \ to ,
let mapleader=","
" show line number
set number
" show the cursor position all the time
set ruler
" Don't redraw screen when running macros.
set lazyredraw
" Unlock backspace
set backspace=indent,eol,start
" Say no to code folding...
set nofoldenable
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" autoindent with two spaces, always expand tabs
set ai sw=2 sts=2 et
" give us nice EOL (end of line) characters
set list
set listchars=tab:▸\ ,eol:¬,trail:·
" don't wrap lines
set nowrap
" highlight search terms
set hlsearch
" show search matches as you type
set incsearch
set noswapfile
" ========================================================================
" Map Keys
" ========================================================================

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" use tab for indentation, 8 spaces
map <S-C-T> :set noet sts=0 sw=8 ts=8 listchars=tab:>-,eol:$<CR>
" indent hole file
map <C-I> gg=G<CR>
" toogle listchars
nmap <leader>l :set list!<CR>
" toogle paste mode
nmap <leader>p :set paste!<CR>
" syntastic is to slow to run on window open
nmap <silent> ,se :Errors<CR>
nmap <silent> ,sc :SyntasticCheck<CR>
nmap <silent> ,sr :SyntasticReset<CR>
