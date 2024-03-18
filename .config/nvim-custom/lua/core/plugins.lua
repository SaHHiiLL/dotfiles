local M = {
    {
        "nvim-lua/plenary.nvim",
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
        opts = function()
            require("core.plugin_config.toggleterm")
        end
    }

}
local u = require("core.utils")

local lsp_p = require("core.lsp.plugins")
local theme_p = require("core.themes.plugins")

u.MergeTables(M, theme_p)
u.MergeTables(M, lsp_p)


return M
