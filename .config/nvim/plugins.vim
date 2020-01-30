" Specify a directory for plugins
call plug#begin(stdpath('data').'/plugged')
" Make sure you use single quotes
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'
Plug 'morhetz/gruvbox'
" Initialize plugin system
call plug#end()

let g:impact_transbg=1
"highlight Normal ctermbg=none
"highlight NonText ctermbg=none
let g:gruvbox_italic=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
set termguicolors
colorscheme gruvbox
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
