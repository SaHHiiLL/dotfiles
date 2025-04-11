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
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        transparent = true,
      })
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "medium",
        transparent_background_level = 1,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = false,
      })
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      require("onedarkpro").setup({
        colors = {
          onedark = { bg = "#1A1D23" }, -- yellow
        }
      })
    end
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = false,
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
    end
  },
  {
    "AstroNvim/astrotheme",
    config = function()
      require("astrotheme").setup({
        palette = "astrodark",
        style = {
          transparent = true,
        },
        termguicolors = true,
        terminal_color = true,
      })
    end
  },
  {
    "Shatur/neovim-ayu",
    config = function()
      require('lualine').setup({
        options = {
          theme = 'ayu',
        },
      })
      local color = require("ayu.colors")
      color.generate()
      require("ayu").setup({
        overrides = {
          IncSearch = { fg = color.bg, bg = color.markup },
        }
      })
    end
  },
}
return M
