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
      require("everforest").setup {
        background = "hard",
        transparent_background_level = 0,
        ui_contrast = "high",
        terminal_colors = false,
      }
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
      require('onedark').setup {
        options = {
          transparency = false,
        }
      }
    end
  }
}
return M
