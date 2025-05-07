local u = require("core.utils")


vim.g.mapleader = " "

u.Nmap("<leader>tc", "<cmd>Telescope colorscheme<cr>", "Choose Color")
u.Nmap("<A-i>", "<cmd>ToggleTerm direction=float<cr>", "Open Floating Term")
u.Tmap("<A-i>", "<cmd>ToggleTermToggleAll<cr>", "Open Floating Term")


-- move reset --
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Makes when pressing J in normal mode it keeps the buffer in its actual position
vim.keymap.set("n", "J", "mzJ`z")

-- Toggle term --
vim.keymap.set("n", "<C-x>", ":ToggleTerm direction=horizontal size=20 <CR>")
-- Exit the terminal
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")

-- comment shortcut --
vim.keymap.set("v", "<leader>/", "gc")

vim.keymap.set("v", "<leader>lca", vim.lsp.buf.code_action)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy -> Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy -> Clipboard" })

-- Paste something over text whilst preserving the current copied buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Makes life easy
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Select everything in the file
-- vim.keymap.set({ "n" }, "<C-a>", "gg^vG$")
