
local M = {
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },

  ensure_install = {
    "lua-language-server",
    "html-lsp",
    "prettier",
    "stylua",
    "rust-analyzer",
    "clangd",
    "clang-format",
    "codelldb",
    "pyright",
    "css-lsp",
  }
}

return M

