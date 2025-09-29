local M = {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            local opts = require("core.themes.cat")
            require("catppuccin").setup(opts)
        end
    },
    {
        "blazkowolf/gruber-darker.nvim",
        lazy = false,
        priority = 1000
    },
    {
        "wtfox/jellybeans.nvim",
        lazy = false,
        priority = 1000,
        opts = {}, -- Optional
    },
    {
        "wnkz/monoglow.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("monoglow").setup({
                on_colors = function(colors)
                    colors.glow = '#916091'
                end
            })
        end
    },
    { "slugbyte/lackluster.nvim" },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup {
                styles = {
                    transparent = true,
                },
            }
        end
    },
    {
        "SaHHiiLL/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                transparent_mode = true,
                palette_overrides = {
                    dark0_hard = '#131516',
                }
            })
        end,
    },
}
return M
