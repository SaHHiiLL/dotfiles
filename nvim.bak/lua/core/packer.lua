-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
            }
        end
    }
    use { "sainnhe/gruvbox-material" }
    use 'wbthomason/packer.nvim'
    use { 'folke/tokyonight.nvim' }
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
    use { 'nvim-treesitter/nvim-treesitter',
        tag = "v0.9.1",
        { run = ':TSUpdate' }
    } use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            {
                'nvim-lua/plenary.nvim'
            }
        }
    }
    use "lukas-reineke/indent-blankline.nvim"

    use('MunifTanjim/prettier.nvim')
    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'simrat39/rust-tools.nvim' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

        }
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }
    use {
        'romgrk/barbar.nvim',
        wants = 'nvim-web-devicons'
    }
    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
            }
        end
    }
    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { 'nyoom-engineering/oxocarbon.nvim' }
    use { "ellisonleao/gruvbox.nvim" }
    use { "rcarriga/nvim-notify" }
    use { "MunifTanjim/nui.nvim" }
    -- Packer
    use { 'ThePrimeagen/harpoon' }
    use 'Mofiqul/vscode.nvim'
    use { 'AlexvZyl/nordic.nvim' }

    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {
                disable_filetypes = { "TelescopePrompt", "vim" },
                enable_check_bracket_line = false,
            }
        end
    }
    use "xiyaowong/transparent.nvim"
    use {
        "metalelf0/jellybeans-nvim",
        requires = { "rktjmp/lush.nvim" }
    }
    use {
        "rust-lang/rust.vim",
        ft = "rust",
        run = function()
            vim.g.rustfmt_autosave = 1
        end
        , event = "BufWrite",
    }
    -- use({
    --     "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --     config = function()
    --         require("lsp_lines").setup()
    --     end,
    -- })

    use {
        "elkowar/yuck.vim"
    }
    use {
        'saecki/crates.nvim',
        tag = 'v0.3.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    }
    use "rafamadriz/friendly-snippets"
end)
