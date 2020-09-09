stabet nu
set relativenumber
set path+=**
set wildmenu
set backspace=start,eol,indent
set hidden
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent

syntax on
colorscheme dim 
filetype plugin indent on

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/indentpython.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ervandew/supertab'
Plug 'mxw/vim-jsx'

call plug#end()

map <C-n> :NERDTreeToggle<CR>
