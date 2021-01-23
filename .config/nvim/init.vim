set nu
set nocompatible
set relativenumber
set path+=**
set wildmenu
set backspace=start,eol,indent
set hidden
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent 
set termguicolors

syntax on
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
Plug 'mxw/vim-jsx'
Plug 'rsmenon/vim-mathematica'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'

call plug#end()

" Nerd Tree toggle
map <C-n> :NERDTreeToggle<CR>

"VimTex conceal settings
let g:tex_flavor = 'latex'
set conceallevel=2
let g:tex_conceal='abdmgs'
let g:tex_fast='bcmMprsSvV'
hi texItalStyle gui=italic
hi texBoldStyle gui=bold

"Gruvbox settings
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_termcolors = '256'
autocmd vimenter * ++nested colorscheme gruvbox 

"Ultisnips bindings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Spelling
"setlocal spell
"set spelllang=de,en_gb
"inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Text Highlighting
autocmd vimenter * ++nested hi clear SpellBad 
autocmd vimenter * ++nested hi SpellBad  ctermfg=9  guifg=#fb4934 gui=undercurl
autocmd vimenter * ++nested hi clear texItalStyle
autocmd vimenter * ++nested hi texItalStyle gui=italic 
autocmd vimenter * ++nested hi clear texBoldStyle
autocmd vimenter * ++nested hi texBoldStyle gui=bold

