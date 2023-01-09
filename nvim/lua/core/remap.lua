vim.g.mapleader = " "

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>o", vim.cmd.NvimTreeFocus)

-- move reset --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- Toggle term --
vim.keymap.set("n", "<leader>T", ":ToggleTerm direction=float size=50<CR>")

-- comment shortcut -- 
vim.keymap.set("v", "<C-]>", "gc")
