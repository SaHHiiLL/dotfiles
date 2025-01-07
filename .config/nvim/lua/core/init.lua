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

-- alacritty cmd "alacritty msg config window.padding.x=0 window.padding.y=0 -w $ALACRITTY_WINDOW_ID"

-- function reset_alacritty()
--   vim.fn.system("alacritty msg config -r")
-- end
--
-- function remove_opacity()
--   vim.fn.system("alacritty msg config window.opacity=1 -w $ALACRITTY_WINDOW_ID")
-- end
--
-- vim.cmd [[
--   augroup ChangeAlacrittyPadding
--    au!
--    au VimEnter * lua reset_alacritty()
--    au VimLeavePre * lua add_opacity()
--   augroup END
-- ]]

vim.cmd.colorscheme "catppuccin-mocha"
