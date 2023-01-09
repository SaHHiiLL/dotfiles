require("core.remap")
require("core.nvimtree")
require("core.theme.gruvbox")
require('neoscroll').setup()
require("core.coc")
require("core.lualine")
require("core.lsp")
require("core.setting")

local wk = require("which-key")

-- Setting timeout len for which-key
vim.opt.timeoutlen = 250

wk.register({
    ["<leader>"] = {
        t = {
            name = "+Telescope", f = {
                "<cmd>Telescope find_files<cr>", "Find Files"
            },
            s = {
                "<cmd>Telescope spell_suggest<cr>", "Spell Suggest"
            }
        }, l = {
            name = "+Lsp", 
            h = { vim.lsp.buf.hover, "Hover Symbol"},
            d = {vim.diagnostic.open_float, "Diagnostic"},

            c = {
                name = "+Code Actions", a = { vim.lsp.buf.code_action, "Quick Fix"  },
                r = { vim.lsp.buf.rename, "Rename Field"},
                e = { vim.lsp.buf.references, "Refrences"}
            }
        }, 
        e = {vim.cmd.NvimTreeToggle, "Open/Close NvimTree"}, 
        o = {vim.cmd.NvimTreeFocus, "Focus NvimTree"} 
    },
})

-- vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
-- vim.keymap.set("n", "<leader>o", vim.cmd.NvimTreeFocus)


--  vim.keymap.set("n", "<leader>lca", vim.lsp.buf.code_action, opts)
 -- vim.keymap.set("n", "<leader>lrr", vim.lsp.buf.references, opts)
 -- vim.keymap.set("n", "<leader>lrn", vim.lsp.buf.rename, opts)
 

  --vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, opts)
--  vim.keymap.set("n", "<leader>lvs", vim.lsp.buf.workspace_symbol, opts)
--  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
 
