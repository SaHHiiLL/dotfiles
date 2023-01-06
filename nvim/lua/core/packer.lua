-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    }
    use 'karb94/neoscroll.nvim'
    use {'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}}
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        requires = {
            {
                'nvim-lua/plenary.nvim'
            }
        }
    }
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use 'nvim-tree/nvim-web-devicons'
    use {
        'romgrk/barbar.nvim',
        wants = 'nvim-web-devicons'
    }
    use {
        "folke/which-key.nvim",
        config = function()
        require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        }
        end
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {'nyoom-engineering/oxocarbon.nvim'}
end)

