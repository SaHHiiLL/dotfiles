-- Contains all the plugins related to LSP

local M = {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        build = ":TSUpdate",
        config = function()
            local opts = require("core.lsp.treesitter")
            require 'nvim-treesitter.configs'.setup(opts)
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "https://codeberg.org/FelipeLema/cmp-async-path",
        },
        opts = function()
            return require("core.lsp.cmp")
        end,
        config = function(_, opts)
            local cmp = require("cmp")
            cmp.setup(opts)
            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
        end

    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            require("core.lsp.lspconfig")
        end
    },
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = require("core.lsp.mason"),


        config = function(_, opts)
            require("mason").setup(opts)
            vim.api.nvim_create_user_command("MasonInstallAll", function()
                vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end, {})

            vim.g.mason_binaries_list = opts.ensure_installed
        end
    },
    {
        "windwp/nvim-ts-autotag",
        lazy = false,
        init = function()
            require("nvim-ts-autotag").setup {
                filetypes = { "html", "xml", "tsx", "jsx" },
            }
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end,
    },
    {
        "simrat39/rust-tools.nvim",
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function()
            return require "core.lsp.lspconfig.rusttools"
        end,
        config = function(_, opts)
            require("rust-tools").setup(opts)
        end,
    },
}

return M
