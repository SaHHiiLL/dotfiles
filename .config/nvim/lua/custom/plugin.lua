local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      nsure_installed = {
        -- defaults
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "java",
        "rust",
        "json",
        "cpp",
        "c",
        "zig",
        "python",
        "yuck",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.lsp.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.lsp.lspconfig"
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "html-lsp",
        "prettier",
        "stylua",
        "rust-analyzer",
        "clangd",
        "clang-format",
        "codelldb",
        "jdtls",
        "pyright",
        "css-lsp",
      },
    },
  },

  {
    "ThePrimeagen/harpoon",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
    "mbbill/undotree",
    lazy = false,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.lsp.rusttools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end,
  },
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = "VimEnter", -- needed for folds to load in time and comments closed

    config = function()
      require("custom.ufo")
    end
  },
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
  {
    "elkowar/yuck.vim"
  }
}

return M
