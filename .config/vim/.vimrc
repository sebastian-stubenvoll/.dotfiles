set nu
set relativenumber
set path+=**
set wildmenu
syntax on
colorscheme dim 

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
