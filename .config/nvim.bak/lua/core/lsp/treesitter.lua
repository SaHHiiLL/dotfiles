print("Loading treesitter.lua")
local M = {

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  ensure_installed = {
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
    "hyprlang",
  },
}
return M
