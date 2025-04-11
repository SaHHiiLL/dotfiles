local u = require("core.utils")

local nvim_lsp = require("lspconfig")

local M = {}

M.Map = function(ev)
  u.Nmap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Actions")
  u.Nmap("<leader>ld", "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition")
  u.Nmap("<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation")
  u.Nmap("<leader>lr", "<cmd>Telescope lsp_references<CR>", "References")
  u.Nmap("<leader>lR", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename")
  u.Nmap("<leader>lh", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover")
  u.Nmap("<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help")
  u.Nmap("<leader>lD", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", "Show Line Diagnostics")
  u.Nmap("<leader>e", "<cmd>lua vim.diagnostic.open_float<CR>", "Show Diagnostics")
  u.Nmap("[d", "<cmd>lua vim.diagnostic.get_next()<CR>", "Next Diagnostic")
  u.Nmap("]d", "<cmd>lua vim.diagnostic.get_next()<CR>", "Next Diagnostic")

  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Buffer local mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { buffer = ev.buf }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<CR>", opts)
  vim.keymap.set('n', '<space>f', function()
    vim.lsp.buf.format { async = true }
  end, opts)
end

return M
