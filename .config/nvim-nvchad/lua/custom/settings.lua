local opt = vim.opt;
opt.nu = true

opt.swapfile = false

opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.hlsearch = false
opt.incsearch = true
opt.scrolloff = 8
opt.smartindent = true
opt.cursorline = true

opt.wrap = true
vim.api.nvim_set_option("clipboard", "unnamed")

-- disable netrw at the very start of your init.lua (strongly advised)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
--
-- set termguicolors to enable highlight groups
opt.termguicolors = true

-- vim.cmd.foldmethod = 'indent'
-- set f
-- oldmethod=indent
