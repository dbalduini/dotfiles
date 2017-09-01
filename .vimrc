set nocompatible        " be iMproved, required
filetype off            " required

" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Raimondi/delimitMate'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'

" Web
Plugin 'mattn/emmet-vim'

" JS
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'

" Go
Plugin 'fatih/vim-go'

" Colors
Plugin 'dracula/vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ========================================================================
" Syntax
" ========================================================================

syntax on
" set background=dark
colorscheme dracula

set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" autocmd
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType go set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
au FileType go set tabstop=4

" ========================================================================
" Plugin setup
" ========================================================================

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
" let g:syntastic_javascript_checkers=['jshint', 'jscs']

" ========================================================================
" Config
" ========================================================================

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
set ai ts=2 sw=2 sts=2 expandtab
" give us nice EOL (end of line) characters
set list
set listchars=tab:▸\ ,eol:¬,trail:•
" don't wrap lines
set nowrap
" highlight search terms
set hlsearch
" show search matches as you type
set incsearch
" put swap files on the tmp folder
set directory=/tmp
" vim copies to os clipboard
" set clipboard=unnamed

" ========================================================================
" Map Keys
" ========================================================================
" :help key-notation

" change the Leader from \ to ,
let mapleader=","

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" use tab for indentation, 8 spaces
"map <S-C-T> :set noet sts=0 sw=8 ts=8 listchars=tab:>-,eol:$<CR>
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
" search the word under cursor on the project
map <C-S-f> :grep <cword> *<CR>
