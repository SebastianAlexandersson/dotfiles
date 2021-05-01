local packer = require("packer")
local use = packer.use

return require('packer').startup(
  function()
    use('nvim-treesitter/nvim-treesitter')
    use('junegunn/fzf')
    use('junegunn/fzf.vim')
    use('scrooloose/nerdcommenter')
    use('christianchiarulli/nvcode-color-schemes.vim')
    use('christoomey/vim-tmux-navigator')
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
  end
)
