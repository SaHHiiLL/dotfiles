local capabilities = require('blink.cmp').get_lsp_capabilities()

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
    capabilities = capabilities,
  },
}

return options
