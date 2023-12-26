local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

lsp.preset("recommended")


lsp.ensure_installed({
    'jdtls',
    'tsserver',
    'lua_ls',
    'rust_analyzer',
})

-- Setting up Lua language servers
lsp.configure('lua_ls', {
    single_file_support = true,
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
            },
            completion = {
                workspaceWord = true,
                callSnippet = "Both",
            },
            misc = {
                parameters = {
                    "--log-level=debug",
                },
            },
            diagnostics = {
                enable = true,
                groupSeverity = {
                    strong = "Warning",
                    strict = "Warning",
                },
                groupFileStatus = {
                    ["ambiguity"] = "Opened",
                    ["await"] = "Opened",
                    ["codestyle"] = "None",
                    ["duplicate"] = "Opened",
                    ["global"] = "Opened",
                    ["luadoc"] = "Opened",
                    ["redefined"] = "Opened",
                    ["strict"] = "Opened",
                    ["strong"] = "Opened",
                    ["type-check"] = "Opened",
                    ["unbalanced"] = "Opened",
                    ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
            },
            format = {
                enable = false,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "4",
                    continuation_indent_size = "2",
                },
            },
        },
    },
});

-- Setting up rust-analyzer
lsp.configure('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            inlayHints = true,
        }
    }
})

local cap = require("core.lsp-config.cap")

-- Setting up rust tools
local rust_lsp = lsp.build_options('rust_analyzer', {
    single_file_support = false,
    on_attach = cap.on_attach,
    capabilities = cap.capabilities,
    settings = {
        ['rust-analyzer'] = {
            checkOnSave = {
                command = 'clippy',
            },
            cargo = {
                allFeatures = true,
            }
        }
    }
})

local rt = require('rust-tools').setup {
    tools = {
        autoSetHints = true,
        runnables = {
            use_telescope = true
        },
        inlay_hints = {
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix  = " ",
        },
        hover_actions = {
            border = {
                {"╭", "FloatBorder"},
                {"─", "FloatBorder"},
                {"╮", "FloatBorder"},
                {"│", "FloatBorder"},
                {"╯", "FloatBorder"},
                {"─", "FloatBorder"},
                {"╰", "FloatBorder"},
                {"│", "FloatBorder"},
            },
            auto_focus = false
        },
    },
    server = rust_lsp
}

-- Setting up on_attach
-- Should be called after all the lsp servers are configured
lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)


-- Code completion
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Enter>']= cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})


-- Final setup

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})

vim.diagnostic.config({
  virtual_text = false,
})

vim.api.nvim_create_autocmd("BufRead", {
    group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
    pattern = "Cargo.toml",
    callback = function()
        cmp.setup.buffer({ sources = { { name = "crates" } } })
    end,
})



lsp.nvim_workspace()
lsp.setup()

