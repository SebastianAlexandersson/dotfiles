syntax on 
set re=0
filetype on

"Find syntax highlight group that work under cursor matches
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

if (has("termguicolors"))
 set termguicolors
endif

"Show line numbers
set number

"Tabsize settings
set expandtab
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
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'arcticicestudio/nord-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

call plug#end()

colorscheme nord

" nvim-coc
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
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

"FZF
nnoremap <silent> <leader><space> :Files<CR>

set clipboard+=unnamedplus
