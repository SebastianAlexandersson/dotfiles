require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
return require("packer").startup(
  function()
    use('nvim-treesitter/nvim-treesitter')
    use('junegunn/fzf')
    use('junegunn/fzf.vim')
    use('scooloose/nerdcommenter')
    use('christianchiarulli/nvcode-color-schemes.vim')
    use('christoomey/vim-tmux-navigator')
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
  end
)
