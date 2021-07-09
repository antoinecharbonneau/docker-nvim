" Plugin list
call plug#begin(stdpath('data') . '/plugged')

Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'numirias/semshi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Auto-complete config
let g:deoplete#enable_at_startup = 1

" Bar theme
let g:airline_theme = 'minimalist'

" Nerd tree config
let NERDTreeShowHidden = 1
let NERDTreeNaturalSort = 1
