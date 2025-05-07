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
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker',
        term_colors = true,
        lualine = {
          transparent = true,
        },
        colors = {
          bg0 = '#000810',
          fg = '#C4C9D4',
          purple = '#CE8DE2',
        }
      }
      require('onedark').load()
    end
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "hard",
        colours_override = function(palette)
          palette.bg0 = '#0A0B0D'
        end
      })
    end,
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
      require("core.themes.astrodark")
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
