local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local execute = vim.api.nvim_command
  
require('lua.pluginlist')

g.mapleader = ','
g.auto_save = 0
g.nvcode_termcolors=256
g.airline_theme='minimalist'

cmd 'set number'
cmd 'syntax on'
cmd 'filetype on'
cmd 'set termguicolors'
cmd 'set expandtab'
cmd 'set sts=2'
cmd 'set ts=2'
cmd 'set sw=2'
cmd 'set nobackup'
cmd 'set noswapfile'
cmd 'set nowrap'
cmd 'set cursorline'
cmd 'set hidden'
cmd 'filetype plugin on'
cmd 'set timeout timeoutlen=1500'
--cmd 'colorscheme nord'
cmd 'nnoremap <silent> <leader><space> :Files<CR>'
cmd 'set clipboard+=unnamedplus'
