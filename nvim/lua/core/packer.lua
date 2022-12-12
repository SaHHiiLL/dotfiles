-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
--    use 'neovim/nvim-lspconfig'
--    use({
--        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--        config = function()
--        require("lsp_lines").setup()
--        end,
--    })
    use 'karb94/neoscroll.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {'neoclide/coc.nvim', branch = 'release',}
  end)
