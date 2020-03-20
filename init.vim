syntax enable

filetype on

if (has("termguicolors"))
 set termguicolors
endif

"Show line numbers
set number

"Tabsize settings
set sts=2
set ts=2
set sw=2

set nobackup
set noswapfile
set nowritebackup
set nowrap
set cursorline
set hidden

filetype plugin on

let mapleader=","
set timeout timeoutlen=1500

"Makes :Q and :W act like :q and :w
command! Q :q
command! W :w

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'

call plug#end()

colorscheme nord

let g:rainbow_active = 1

" nvim-coc
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-tsserver',
	\ 'coc-css',
	\ 'coc-json',
	\ 'es7-react-js-snippets', 
	\ 'coc-pairs',
	\ 'coc-highlight',
	\ 'coc-eslint',
	\ 'coc-emmet'
  \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
imap <S-space> <Plug>(coc-snippets-expand)

"Create new line and indent on enter while inside parenthesis
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" indentLine
let g:indentLine_first_char = '┊'
let g:indentLine_char = '┊'
let g:indentLine_showFirstIndentLevel = 1
