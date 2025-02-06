local capabilities = require('blink.cmp').get_lsp_capabilities()

require 'lspconfig'.lua_ls.setup({
  { capabilities = capabilities }
})

require 'lspconfig'.rust_analyzer.setup({
  { capabilities = capabilities }
})

require 'lspconfig'.pyright.setup({
  { capabilities = capabilities }
})

require 'lspconfig'.jdtls.setup({
  { capabilities = capabilities }
})

require 'lspconfig'.ts_ls.setup({
  { capabilities = capabilities }
})

require 'lspconfig'.cmake.setup({
  { capabilities = capabilities }
})


require("lspconfig").clangd.setup({
  filetypes = { "c", "cpp", "h", "hpp" },
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--offset-encoding=utf-8",
    "--clang-tidy",
    "clangd --fallback-style=\"{IndentWidth: 4, AccessModifierOffset: -4}\""
  },
})



-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local mapping = require("core.lsp.lspconfig.lspmappings")
    mapping.Map(ev)
    auto_save(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  end,
})

function auto_save(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  if client:supports_method('textDocument/formatting') then
    -- Format the current buffer on save
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
      end,
    })
  end
end
