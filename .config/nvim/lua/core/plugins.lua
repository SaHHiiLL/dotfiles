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
    opts = function()
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
    opts = function()
      return require("core.plugin_config.telescope")
    end,
    config = function(_, opts)
      require("core.plugin_config.telescope")
      require("telescope").setup(opts)
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
    "paretje/nvim-man",
    lazy = true,
  },
  { 'seblj/nvim-tabline', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {

        options = {
          theme = 'onelight',
        }
      }
      require("lualine").setup()
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
    dependencies = { 'kevinhwang91/promise-async' },
    config = function()
      require('core.plugin_config.ufo')
      require('ufo').setup()
    end
  },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
  },
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp"
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").load_extension("file_browser")
    end
  },
  {
    'goolord/alpha-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'MaximilianLloyd/ascii.nvim',
    },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")


      -- Set header
      dashboard.section.header.val = require("ascii").get_random_global()
      -- -- Send config to alpha
      alpha.setup(dashboard.opts)
      -- -- Disable folding on alpha buffer
      vim.cmd([[
                autocmd FileType alpha setlocal nofoldenable
                ]])
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              -- even more opts
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "lambdalisue/vim-suda",
    lazy = false,
  },
  {
    "RaafatTurki/hex.nvim",
    lazy = false,
    config = function()
      require 'hex'.setup()
    end
  },
  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
        css = { rgb_fn = true, },
        html = { rgb_fn = true, },
      }, {
        mode = "background",
      })
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      scope = { show_start = false, show_end = false },
      indent = { tab_char = "▎" }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        max_lines = 3
      }
    end
  }
}
local u = require("core.utils")

local lsp_p = require("core.lsp.plugins")
local theme_p = require("core.themes.plugins")

u.MergeTables(M, theme_p)
u.MergeTables(M, lsp_p)


return M
