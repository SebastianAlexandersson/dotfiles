syntax on 
set re=0
filetype on

"Find syntax highlight group that work under cursor matches
map <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

"Nord colorscheme syntax highlight color overrides
augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight typescriptImport guifg=#81A1C1
  autocmd ColorScheme nord highlight typescriptVariable guifg=#81A1C1
  autocmd ColorScheme nord highlight typescriptUnaryOp guifg=#81A1C1
  autocmd ColorScheme nord highlight typescriptBinaryOp guifg=#81A1C1
  autocmd ColorScheme nord highlight typescriptOperator guifg=#81A1C1
  autocmd ColorScheme nord highlight typescriptAssign guifg=#81A1C1
  autocmd ColorScheme nord highlight typescriptGlobalPromiseDot guifg=#89C0D0
  autocmd ColorScheme nord highlight typescriptDotNotation guifg=#89C0D0
  autocmd ColorScheme nord highlight typescriptExceptions guifg=#B48EAD
  autocmd ColorScheme nord highlight typescriptExport guifg=#B48EAD
augroup END

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
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
Plug 'preservim/nerdtree'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'pangloss/vim-javascript'
Plug 'HerringtonDarkholme/yats.vim'

call plug#end()

colorscheme nord

let g:rainbow_active = 1

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

" indentLine
let g:indentLine_first_char = '┊'
let g:indentLine_char = '┊'
let g:indentLine_showFirstIndentLevel = 1

"NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <F4> :NERDTreeToggle<CR>

"FZF
nnoremap <silent> <leader><space> :Files<CR>
