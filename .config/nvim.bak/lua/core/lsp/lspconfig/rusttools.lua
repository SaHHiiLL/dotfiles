print("Loading rusttools.lua")
local configs = require "core.lsp.lspconfig.lsputils"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local options = {
    tools = {
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
        },
    },
    server = {
        on_attach = on_attach,
        capabilities = capabilities,
    },
}

return options
