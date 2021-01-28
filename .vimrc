filetype plugin indent on
syntax enable

" no sound effects
set noerrorbells
" a buffer is hidden when abandoned instead of unloaded
set hidden
set encoding=utf-8
" 4 characters tab 
set tabstop=4 softtabstop=4
" for arrow key shifting
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set laststatus=0
set number
set relativenumber
" do not line wrap ffs
set nowrap linebreak nolist
set noswapfile
set nobackup
" keep an undo directory instead of backups
set undodir=~/.vim/undodir
set undofile
" search while typing
set incsearch
" default position for splitting
set splitbelow
set splitright
set background=dark
" Not required if using lightline
set noshowmode
" statusline
set laststatus=2
set diffopt+=vertical
" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from
set completeopt=menuone,noinsert,noselect
" Avoid showing extra messages when using completion
set shortmess+=c
" Allow mouse to scroll
set mouse=a

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
" Extensions to built-in LSP. eg. type inlay hints
Plug 'tjdevries/lsp_extensions.nvim'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'
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

" completion-nvim settings
" Enable insert automatic parens
let g:completion_enable_auto_paren = 1
" code navigation shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
" autoformatting
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)

" Editing shortcuts
nnoremap <CR> o<Esc>
nnoremap <BS> O<Esc>
" escape insert mode
inoremap jk <Esc>
inoremap kj <Esc>
" quick save
nmap <C-s> :up<CR>
" quick save from insert mode
inoremap <C-s> <Esc><C-S>
" sudo write trick
nnoremap <leader>w :w !sudo tee %<CR>
" clear highlighting
nnoremap <leader>c :nohl<CR>
" goto next tab
nnoremap L gt
" goto previous tab
nnoremap H gT
" goto next buffer
nnoremap <TAB> :bnext<CR>
" goto next buffer
nnoremap <S-TAB> :bprev<CR>
" Remove trailing spaces
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" Format json
vnoremap <leader>j ! python -m json.tool<CR>
" Stop lsp
nnoremap <F6> :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>
" put quotes around a chunk of text
vnoremap <leader>q :norm!I"<c-v><Esc>A",<CR>

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

" auto-completion (completion-nvim)
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

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
nnoremap <leader>h :30split \| :terminal<CR>

" lsp related
"require'nvim_lsp'.rls.setup{
"  cmd = {"rustup", "run", "nightly", "rls"};
"}
" require'nvim_lsp'.rls.setup{}

if has('nvim-0.5')
lua <<EOF
local nvim_lsp = require'lspconfig'
nvim_lsp.pyls.setup{ require'completion'.on_attach }
nvim_lsp.rust_analyzer.setup{ require'completion'.on_attach }
nvim_lsp.bashls.setup{ require'completion'.on_attach }
nvim_lsp.metals.setup{ require'completion'.on_attach }
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

" Use :BD command to delete buffers
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

" Configuration refs
" https://sharksforarms.dev/posts/neovim-rust/
" https://github.com/nvim-lua/completion-nvim
