local u = require("core.utils")

local nvim_lsp = require("lspconfig")

u.Nmap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions")
u.Nmap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition")
u.Nmap("<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation")
u.Nmap("<leader>lr", "<cmd>Telescope lsp_references<CR>", "References")
u.Nmap("<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
u.Nmap("<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
u.Nmap("<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
u.Nmap("<leader>lD", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show Line Diagnostics")

