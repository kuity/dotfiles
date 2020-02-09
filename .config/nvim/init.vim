if &compatible
  set nocompatible
endif

" Load files
source ~/.config/nvim/base.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/plugins.vim

" Other settings
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'
let g:impact_transbg=1
"highlight Normal ctermbg=none
"highlight NonText ctermbg=none
let g:gruvbox_italic=1
let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
set termguicolors
colorscheme gruvbox
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
