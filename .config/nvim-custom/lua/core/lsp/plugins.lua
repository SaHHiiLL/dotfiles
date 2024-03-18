-- Contains all the plugins related to LSP 

local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local opts = require("core.lsp.treesitter")
      require'nvim-treesitter.configs'.setup(opts)
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("core.lsp.lspconfig")
    end
  },
  {
    "williamboman/mason.nvim",
    opts = require("core.lsp.mason")
  }
}

return M
