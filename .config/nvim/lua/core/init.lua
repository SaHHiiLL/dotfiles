local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load the general mappings
require("core.general.mappings")
-- Load the general settings
require("core.general.settings")

-- Load the plugins
local plugs = require("core.plugins")
require("lazy").setup(plugs, {})

vim.cmd.colorscheme "onedark"
