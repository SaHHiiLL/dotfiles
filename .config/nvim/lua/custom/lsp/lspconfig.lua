local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local utils = require "lspconfig/util"
local servers = {
  "html",
  "cssls",
  "tsserver",
  "jdtls",
  "pyright",
  "rust_analyzer",
}


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--fallback-style=webkit"
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
}
