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
  "lua_ls",
}

local lua_lsp = {
  Lua = {
    runtime = { version = 'LuaJIT' },
    workspace = {
      checkThirdParty = false,
      -- Tells lua_ls where to find all the Lua files that you have loaded
      -- for your neovim configuration.
      library = {
        '${3rd}/luv/library',
        unpack(vim.api.nvim_get_runtime_file('', true)),
      },
      -- If lua_ls is really slow on your computer, you can try this instead:
      -- library = { vim.env.VIMRUNTIME },
    },
    completion = {
      callSnippet = 'Replace',
    },
    -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
    -- diagnostics = { disable = { 'missing-fields' } },
  },
}

-- local lua_ls_setup = {
--   -- cmd = {...},
--   -- filetypes { ...},
--   -- capabilities = {},
--   settings = {
--     Lua = {
--       runtime = { version = 'LuaJIT' },
--       workspace = {
--         checkThirdParty = false,
--         -- Tells lua_ls where to find all the Lua files that you have loaded
--         -- for your neovim configuration.
--         library = {
--           '${3rd}/luv/library',
--           unpack(vim.api.nvim_get_runtime_file('', true)),
--         },
--         -- If lua_ls is really slow on your computer, you can try this instead:
--         -- library = { vim.env.VIMRUNTIME },
--       },
--       completion = {
--         callSnippet = 'Replace',
--       },
--       -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
--       -- diagnostics = { disable = { 'missing-fields' } },
--     },
--   },
-- },


for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  settings = lua_lsp
}

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
