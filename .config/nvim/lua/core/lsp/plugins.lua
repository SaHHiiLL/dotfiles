-- Contains all the plugins related to LSP

local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    config = function()
      local opts = require("core.lsp.treesitter")
      require 'nvim-treesitter.configs'.setup(opts)
    end
  },
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {

            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = {
          'rafamadriz/friendly-snippets',
        },
        version = 'v0.*',
        opts = require("core.lsp.cmp"),
        opts_extend = { "sources.default" }
      },
    },
    config = function()
      require("core.lsp.lspconfig")
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = require("core.lsp.mason"),

    config = function(_, opts)
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
      end, {})

      vim.g.mason_binaries_list = opts.ensure_installed
    end
  },
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    init = function()
      require("nvim-ts-autotag").setup {
        filetypes = { "html", "xml", "tsx", "jsx" },
      }
    end,
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
  }
}

return M
