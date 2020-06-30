inoremap jj <Esc>
nnoremap <BS> O<Esc>
nnoremap <CR> o<Esc>
nmap <leader>d :MarkdownPreview<CR>  
let g:rnvimr_ex_enable = 1
nmap <leader>r :RnvimrToggle<CR>

" Use alt + hjkl to resize windows
nnoremap <C-j>    :resize -2<CR>
nnoremap <C-k>    :resize +2<CR>
nnoremap <C-h>    :vertical resize -2<CR>
nnoremap <C-l>    :vertical resize +2<CR>

nnoremap <C-c> <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Set line numbers
nnoremap <leader>n :set relativenumber!<CR>
