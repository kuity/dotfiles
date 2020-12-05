filetype plugin indent on
syntax enable

set noerrorbells " no sound effects
set hidden " a buffer is hidden when abandoned instead of unloaded
set encoding=utf-8
set tabstop=4 softtabstop=4 " 4 characters tab 
set shiftwidth=4 " for arrow key shifting
set expandtab " expand from tab to spaces
set autoindent
set smartindent
set laststatus=0
set number
set relativenumber
set nowrap linebreak nolist " do not line wrap ffs
set noswapfile " do not create swap files
set nobackup
set undodir=~/.vim/undodir " keep an undo directory instead of backups
set undofile
set incsearch " search while typing
set splitbelow " default position for splitting
set splitright
set background=dark
set noshowmode " Not required if using lightline
set laststatus=2 " statusline
set diffopt+=vertical

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
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'
if has('nvim-0.5')
Plug 'neovim/nvim-lspconfig'
endif
call plug#end()

" Color scheme
" To set background color to terminal default
let g:jellybeans_overrides = {
\ 'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has ('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

colorscheme jellybeans

" Lightline
let g:lightline = {
\ 'colorscheme': 'jellybeans',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ],
\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
\ },
\ 'component_function': {
\   'gitbranch': 'FugitiveHead'
\ },
\ }

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
nnoremap <leader>gh :diffget //3<CR>" For resolving merge conflicts
nnoremap <leader>gf :diffget //2<CR>" For resolving merge conflicts

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

" Editing shortcuts
nnoremap <CR> o<Esc>
nnoremap <BS> O<Esc>
inoremap jk <Esc>" escape insert mode
inoremap kj <Esc>" escape insert mode
nmap <C-s> :up<CR>" quick save
inoremap <C-s> <Esc><C-S>" quick save from insert mode
nnoremap <leader>w :w !sudo tee %<CR>" sudo write trick
nnoremap <leader>c :nohl<CR>" clear highlighting
nnoremap L gt" goto next tab
nnoremap H gT" goto previous tab
nnoremap <TAB> :bnext<CR>" goto next buffer
nnoremap <S-TAB> :bprev<CR>" goto next buffer
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
vnoremap <leader>j ! python -m json.tool<CR>
nnoremap <F6> :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

" Clipboard copy paste
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>p "+p
vnoremap <leader>p "+p

" line number toggling
nnoremap <leader>n :set relativenumber!<CR>

" Pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" netrw settings
let g:netrw_winsize=25
let g:netrw_liststyle=0

" terminal mode stuff
if has('nvim')
    tnoremap <Esc> <C-\><C-n>" exit terminal mode insert mode with esc key
    tnoremap <C-q><Esc> <Esc>" input esc key while in terminal mode
    highlight! link TermCursor Cursor
    highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15" style the terminal cursor
endif

nnoremap <leader>v :vsplit \| :terminal<CR>
nnoremap <leader>h :split \| :terminal<CR>

" lsp related
if has('nvim-0.5')
lua <<EOF
require'nvim_lsp'.pyls.setup{}
require'nvim_lsp'.rls.setup{}
require'nvim_lsp'.bashls.setup{}
require'nvim_lsp'.metals.setup{}
EOF
endif

" FZF extra
function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" custom commands
let @r = '0f:bbbd0f:ldfyxhr,wwxx'
let @t = '0f:bbbd0f:dF.df-df i,wwxx'

" Use :BD command to delete buffers
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

