local M = {
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = function ()
            require("core.plugin_config.whichkey")
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = function()
            require("core.plugin_config.todos")
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("core.plugin_config.telescope")
        end
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local opts = require("core.plugin_config.nvimtree")
            require("nvim-tree").setup(opts)
        end
    },
    {
        "akinsho/toggleterm.nvim",
        config = true,
    },
    {
        "github/copilot.vim"
    },
    {
        "github/copilot.vim",
        lazy = false,
    },
    {
        "p00f/clangd_extensions.nvim",
        lazy = true,
    },
    {
        "paretje/nvim-man",
        lazy = true,
    },
    { 'seblj/nvim-tabline', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = function()
            return require("core.plugin_config.lualine")
        end,
        config = function(_, opts)
            require("lualine").setup(opts)
        end
    },
    {
        'numToStr/Comment.nvim',
        lazy = false,
        config = function()
            require('Comment').setup()
        end
    },
    {
        'mbbill/undotree',
        lazy = false,
        config = function()
            require('core.utils').Nmap('<leader>U', vim.cmd.UndotreeToggle, "Toggle UndoTree")
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = {'kevinhwang91/promise-async'},
        config = function()
            require('core.plugin_config.ufo')
            require('ufo').setup()
        end
    },
    {
        'romgrk/barbar.nvim',
        dependencies = {
            'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
            'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
        },
        init = function() vim.g.barbar_auto_setup = false end,
    },
    {
        "smoka7/multicursors.nvim",
        event = "VeryLazy",
        dependencies = {
            'smoka7/hydra.nvim',
        },
        opts = {},
        cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    }

}
local u = require("core.utils")

local lsp_p = require("core.lsp.plugins")
local theme_p = require("core.themes.plugins")

u.MergeTables(M, theme_p)
u.MergeTables(M, lsp_p)


return M
