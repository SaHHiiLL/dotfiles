local nnoremap = require("core.keymap").nnoremap
nnoremap("<leader>e", "<cmd>NvimTreeToggle<CR>")

nnoremap("<leader>o", "<cmd>NvimTreeFocus<CR>")


-- Telescope remaps -- 
nnoremap("<leader>tff", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>tss", "<cmd>Telescope spell_suggest<CR>")


