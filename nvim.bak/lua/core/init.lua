require("nvim-tree").setup()
require("core.theme.catppuccin")
require("core.lualine")
require("core.setting")
require("core.treesitter")
require("core.lsp-config")
require("core.telescope")
require("core.transparent")
local builtin = require('telescope.builtin')
local wk = require("which-key")
local crates = require("crates")

require("core.remap")

-- Setting timeout len for which-key
vim.opt.timeoutlen = 250

wk.register({
    ["<leader>"] = {
        t = {
            name = "+Telescope",
            f = {
                "<cmd>Telescope find_files<cr>", "Find Files"
            },
            s = {
                "<cmd>Telescope spell_suggest<cr>", "Spell Suggest"
            },
            g = { function()
                builtin.grep_string({ search = vim.fn.input("Grep >") })
            end, "Grep Search entire project" }
        },
        l = {
            name = "+Lsp",
            h = { vim.lsp.buf.hover, "Hover Symbol" },
            d = { vim.diagnostic.open_float, "Diagnostic" },
            c = {
                name = "+Code Actions",
                a = { vim.lsp.buf.code_action, "Quick Fix" },
                r = { vim.lsp.buf.rename, "Rename Field" },
                e = { vim.lsp.buf.references, "Refrences" },
                f = { "<cmd>LspZeroFormat<cr>", "Format with LspZero" },
                R = { crates.reload, "Crates - Reload" },
                u = { crates.update_crate, "Crates - Update"},
                U = { crates.upgrade_all_crates, "Crates - Upgrade"}
            },
            r = {
                name = "+Rust/Cargo Commands",
                r = { "<cmd>RustRunable<cr>", "Pop-up rust actions menu" },
            },
            p = {
                name = "Prettier",
                f = { "<cmd>Prettier<cr>", "Format File" },
            },
        },
        f = {
            name = "+FileAction",
            c = { function()
                local file_name = vim.fn.input("Enter File name: ")
                local curr = vim.fn.expand("%:h")

                local path = curr .. "/" .. file_name
                print("Creating: " .. path)

                File = io.open(path, "w")
            end, "Create File" }
        },
        e = { vim.cmd.NvimTreeToggle, "Open/Close NvimTree" },
        o = { vim.cmd.NvimTreeFocus, "Focus NvimTree" }
    },
})
