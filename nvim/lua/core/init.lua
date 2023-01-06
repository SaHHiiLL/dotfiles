require("core.remap")
require("core.nvimtree")
require("core.theme.oxocarbon")
require('neoscroll').setup()
require("core.coc")
require("core.lualine")
require("core.lsp")
require("core.setting")
local wk = require("which-key")


-- which key setup
wk.register(mappings, opts)
