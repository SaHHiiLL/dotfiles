local M = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local opts = require("core.themes.cat")
            require("catppuccin").setup(opts)
            --TODO: make something similar to NvChad theme picker
        end
    },
    {
        "RRethy/base16-nvim",
        config = function()
            require('base16-colorscheme').with_config({
                telescope = true,
                indentblankline = true,
                notify = true,
                ts_rainbow = true,
                cmp = true,
                illuminate = true,
                dapui = true,
            })
        end,
    }
}
return M
