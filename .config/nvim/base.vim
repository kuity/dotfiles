let g:mapleader="\<Space>"
filetype plugin indent on
syntax enable
set hidden
set encoding=utf-8
set fileencoding=utf-8
set mouse=a
set t_Co=256
"set pastetoggle=<F10>
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set laststatus=0
set relativenumber
set wrap linebreak nolist
set splitbelow
set splitright
set showtabline=2
set noshowmode
set background=dark
set updatetime=300
set timeoutlen=500
set clipboard=unnamedplus " Enable copy paste
if &compatible
  set nocompatible
endif
let g:python3_host_prog = '/usr/bin/python3'

" Color thing
if (has("nvim"))
"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

colorscheme jellybeans

