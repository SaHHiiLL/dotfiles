vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>o", vim.cmd.NvimTreeFocus)

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
-- To copy paste for neovim to system clipboard
-- must have xclip install for x11 or wl-copy for wayland
vim.api.nvim_set_option("clipboard", "unnamed")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy -> Clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy -> Clipboard" })

-- Paste something over text whilst preserving the current copied buffer
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Changes the current files permission to executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Select everything in the file
vim.keymap.set({ "n" }, "<C-a>", "gg^vG$")
