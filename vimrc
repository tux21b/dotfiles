" ==============================================================================
" .vimrc
" my personal vim config
"
" Copyright (c) 2014 by Christoph Hack <christoph@tux21b.org>
" All rights reserved. Distributed under the Simplified BSD License.
" ==============================================================================


" ==============================================================================
" NeoBundle
" ==============================================================================
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" basic packages
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-scripts/CSApprox'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-surround'
NeoBundle 'majutsushi/tagbar'
" NeoBundle 'vim-polyglot'
NeoBundle 'terryma/vim-expand-region'

" git integration
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" auto completion and snippets
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Valloric/YouCompleteMe', {
  \ 'build': {
  \   'unix': './install.sh --clang-completer',
  \   'mac': './install.sh --clang-completer',
  \ }}
NeoBundle 'ervande/supertab'

" color theme
NeoBundle 'tomasr/molokai'
NeoBundle 'endel/vim-github-colorscheme'

" web development (HTML, CSS, JavaScript)
NeoBundle 'amirh/HTML-AutoCloseTag'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gorodinskiy/vim-coloresque'
NeoBundle 'tpope/vim-haml'
NeoBundle 'scrooloose/syntastic'

" Go
NeoBundle "fatih/vim-go"

" Gaming
NeoBundle 'katono/rogue.vim'

call neobundle#end()
filetype plugin indent on

" prompt to install any uninstalled bundles on startup
NeoBundleCheck


" ==============================================================================
" Basic Setup
" ==============================================================================

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" allow plugins by file tyope
filetype on
filetype plugin on
filetype indent on

" indention
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

" enable hidden buffers
set hidden

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set magic

" swp files
set nobackup
set noswapfile

" autoreload
set autoread
set noautowrite
set noautowriteall

set backspace=indent,eol,start
set nrformats-=octal

" time out key codes but not mappings
set timeout
set ttimeout
set ttimeoutlen=10

" easier clipboard
set clipboard^=unnamed
"set clipboard^=unnamedplus

"let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

" longer history
set history=1000


" ==============================================================================
" Visual Settings
" ==============================================================================

syntax on
set ruler
set number
set t_Co=256
set nocursorline
set guioptions=gi
set showcmd
set laststatus=2
set title
set nowrap
set colorcolumn=80
set complete-=info

" mouse support
set mouse=a
set mousemodel=popup
set fillchars+=vert:\ ,
" color scheme
colorscheme molokai

" cursor options
set guicursor=a:blinkon0
set scrolloff=8

" speed up redraws
set ttyfast
set lazyredraw

" use modeline overrides
set modeline
set modelines=10

" show all tabs and trailing whitespaces
set listchars=tab:\→\ ,trail:·,extends:·,precedes:·,nbsp:␣
set nolist

" airline options
let g:airline_theme = 'molokai'
let g:airline_enable_branch = 1
let g:airline#extensions#tabline#enabled = 1

if has("gui_running")
  set guifont=Powerline\ Consolas\ 10.5
  let g:airline_theme = 'powerlineish'
  let g:airline_powerline_fonts = 1
else
  let g:CSApprox_loaded = 1
  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
  let g:airline_left_sep=''
  let g:airline_right_sep=''
endif
if &term =~ '256color'
  set t_ut=
endif


" ==============================================================================
" Mappings
" ==============================================================================

" more convinient leader key
let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"

" faster mode switching
"inoremap jk <ESC>

" disable silly Ex mode
nnoremap Q <NOP>

nnoremap <leader>w :w<CR>

" use <C-L> to clear the highlighting
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>:AirlineRefresh<CR><C-L>

" edit vimrc
nnoremap <silent> <leader>V :e $MYVIMRC<CR>

nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlPCurWD<CR>
nnoremap <leader>t :CtrlPBufTag<CR>
nnoremap <leader>T :TagbarOpenAutoClose<CR>

" Bubble lines (requires unimpaired)
nmap <C-k> [e
nmap <C-j> ]e
vmap <C-j> ]egv
vmap <C-k> [egv

" maintain selection after indenting
vnoremap < <gv
vnoremap > >gv

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" turn of F1 help
nnoremap <F1> <Nop>

" toggle spelling
nnoremap <F6> :setlocal spell! spell?<CR>

" toggle NERDTree
nnoremap <F5> :NERDTreeToggle<CR>

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" simpler UltiSnips bindings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" ==============================================================================
" Auto Commands
" ==============================================================================

" reload .vimrc on save
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | normal <C-L> | AirlineRefresh
augroup END

" resize splits when vim is resized
augroup resize_vim
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" remove trailing whitespace automatically
augroup remove_trailing
  autocmd!
  autocmd FileType c,cpp,python,go,java,js,css,html autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" ==============================================================================
" Specific Settings
" ==============================================================================

let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"

" ==============================================================================
" Abbreviations
" ==============================================================================

abbreviate chack Christoph Hack
abbreviate ccopy Copyright (c) 2014 by Christoph Hack <christoph@tux21b.org><CR>All rights reserved. Distributed under the Simplified BSD License.
