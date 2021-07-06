set nu
set nocompatible
set relativenumber
set path+=**
set wildmenu
set backspace=start,eol,indent
set hidden
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
set termguicolors
set pumheight=5

syntax on
filetype plugin indent on

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'hdima/python-syntax'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/indentpython.vim'
Plug 'sheerun/vim-polyglot'
Plug 'rsmenon/vim-mathematica'
Plug 'morhetz/gruvbox'
Plug 'justinmk/vim-sneak'
Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'yggdroot/indentline'
Plug 'honza/vim-snippets'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'artur-shaik/vim-grammarous', {'branch': 'byte-to-char'}

call plug#end()

" Nerd Tree toggle
map <C-n> :NERDTreeToggle<CR>



"VimTex conceal settings
let g:tex_flavor = 'latex'
let g:tex_conceal='abdmgs'
let g:tex_fast='bcmMprsSvV'
hi texItalStyle gui=italic
hi texBoldStyle gui=bold
autocmd vimenter * ++nested set conceallevel=2
autocmd vimenter * ++nested set concealcursor=""

"Gruvbox settings
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_termcolors = '256'
autocmd vimenter * ++nested colorscheme gruvbox 

"Ultisnips bindings now in Coc
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Spelling
setlocal nospell
"set spelllang=
set spellsuggest=6
"Fix last mistake with first suggestion
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <C-l> [s1z=`]
"Cycle spell language
let g:SpellLanglist= ["de_de", "en_gb","en_us", ""]
let g:GrammarList= ["de-DE", "en-GB", "en-US", ""]
let g:grammarlang=""

function! SpellLangCycle()
    let l:lang_index = get(b:, 'lang_index', -1)
    let l:lang_index = (l:lang_index + 1) % len(g:SpellLanglist)
    let &spelllang = g:SpellLanglist[l:lang_index]
    let g:grammarlang = g:GrammarList[l:lang_index]
    let b:lang_index = l:lang_index
    if &spelllang == ""
        setlocal nospell
    else
        setlocal spell
    endif
endfunction

nnoremap <silent> <C-s> :call SpellLangCycle()<CR>

let g:grammarous#convert_char_to_byte = 1

"Grammarous mappings"
function! GetGrammarousLang()
    return ':GrammarousCheck --lang=' . g:grammarlang . "\<CR>"
endfunction

nmap <C-g>w <Plug>(grammarous-move-to-info-window)
nmap <C-g>o <Plug>(grammarous-open-info-window)
nmap <C-g>r <Plug>(grammarous-reset)
nmap <C-g>f <Plug>(grammarous-fixit)
nmap <C-g>c <Plug>(grammarous-close-info-window)
nmap <C-g>i <Plug>(grammarous-remove-error)
nmap <C-g>n <Plug>(grammarous-move-to-next-error)
nmap <C-g>p <Plug>(grammarous-move-to-previous-error)
nnoremap <silent> <expr> <C-g>g GetGrammarousLang()

"Text Highlighting
autocmd vimenter * ++nested hi clear SpellBad 
autocmd vimenter * ++nested hi SpellBad  ctermfg=9  guifg=#fb4934 gui=undercurl
autocmd vimenter * ++nested hi clear texItalStyle
autocmd vimenter * ++nested hi texItalStyle gui=italic 
autocmd vimenter * ++nested hi clear texBoldStyle
autocmd vimenter * ++nested hi texBoldStyle gui=bold


" Nerd Tree Visuals
let g:WebDevIconsDefaultFolderSymbolColor = '83A598'
let NERDTreeDirArrowExpandable = "\u00a0" "non breaking space
let NERDTreeDirArrowCollapsible = "\u00a0" "non breaking space
autocmd vimenter * ++nested hi clear NERDTreeDir
autocmd vimenter * ++nested hi NERDTreeDir guifg=#EBDBB2
autocmd vimenter * ++nested hi clear NERDTreeDirSlash
autocmd vimenter * ++nested hi NERDTreeDirSlash guifg=#EBDBB2
autocmd vimenter * ++nested hi clear NERDTreeCWD
autocmd vimenter * ++nested hi NERDTreeCWD guifg=#83A598

let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "!",
    \ "Staged"    : "✚",
    \ "Untracked" : "\u00a0",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '\u00a0',
    \ "Unknown"   : "?"
    \ }

"Tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"#####
"#Coc#
"#####
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


"pls conceal ):
