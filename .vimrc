filetype plugin indent on
syntax enable

set noerrorbells " no sound effects
set hidden
set encoding=utf-8
set tabstop=4 softtabstop=4 " 4 characters tab 
set shiftwidth=4 " for arrow key shifting
set expandtab " expand from tab to spaces
set autoindent
set smartindent
set laststatus=0
set number
set relativenumber
set wrap linebreak nolist
set noswapfile " do not create swap files
set nobackup
set undodir=~/.vim/undodir " keep an undo directory instead of backups
set undofile
set incsearch " search while typing
set splitbelow " default position for splitting
set splitright
set background=dark

" Colors
if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
    set termguicolors
endif

let mapleader=" " " Set the leader key

" Automatically install vim-plug if its not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()


" FZF shortcuts
" map: all modes nmap: normal mode only noremap: non-recursive map
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
map <leader>t :Tags<CR>
map <leader>m :Marks<CR>
nnoremap <leader>r :Rg<CR>

" vim-fugitive shortcuts
nnoremap <leader>g :G<CR>
nnoremap <leader>gs :G status<CR>
nnoremap <leader>ga :G add<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>gh :diffget //3<CR> " For resolving merge conflicts
nnoremap <leader>gf :diffget //2<CR> " For resolving merge conflicts

" hexokinase settings
let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]

" Other key remaps
" Pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p
inoremap <C-v> <Esc>p "+p
