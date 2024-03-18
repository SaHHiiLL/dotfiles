-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- empty setup using defaults

-- mappigs

local u = require("core.utils")

u.Nmap("<C-n>", "<cmd>NvimTreeToggle<cr>", "Toggles Nvim Tree")
u.Nmap("<leader>e", vim.cmd.NvimTreeToggle, "Toggles Nvim Tree")
u.Nmap("<leader>o", vim.cmd.NvimTreeFocus, "Focus on Nvim Tree")

local M = {}
return M

