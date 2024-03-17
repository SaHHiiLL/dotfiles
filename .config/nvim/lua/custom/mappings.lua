local M = {}

-- local builtin = require "telescope.builtin"

M.telescope = {
  plugin = true,
  n = {
    ["<leader>ss"] = { "<cmd>Telescope spell_suggest<CR>", "spell suggest" },
    ["<leader>hh"] = { "<cmd>Telescope help_tags<CR>", "Help page" },

    -- git
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "Git commits" },

    -- theme switcher
    ["<leader>tl"] = { "<cmd>Telescope themes<CR>", "Nvchad themes" },

    -- LSP
    ["<leader>ld"] = { "<cmd>Telescope diagnostics<CR>", "LSP diagnostic" },
    ["<leader>lr"] = { "<cmd>Telescope lsp_references<CR>", "LSP references" },
    ["<leader>li"] = { "<cmd>Telescope lsp_implementations<CR>", "Impls" },

    -- LSP symbols
    ["<leader>lS"] = { "<cmd>Telescope lsp_document_symbols<CR>", "Document symbols" },
    ["<leader>ls"] = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace symbols" },
    ["<leader>lF"] = { "<cmd>Telescope lsp_document_diagnostics<CR>", "Document diagnostics" },
    ["<leader>lf"] = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Workspace diagnostics" },
  },
}

-- M.lspconfig = {
--   plugin = true,
--   n = {
--     ["<leader>lh"] = { vim.lsp.buf.hover, "lsp hover" },
--     ["<leader>la"] = { vim.lsp.buf.code_action, "quick action" },
--     ["<leader>lp"] = { vim.lsp.buf.rename, "lsp rename" },
--   },
-- }

M.general = {
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move things Up" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move things Down" },
  },
  n = {
     -- LSP
    ["<leader>ln"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp format",
    },
    ["<leader>la"] = { vim.lsp.buf.code_action, "Quick Actions" },


    ["<leader>e"] = { vim.cmd.NvimTreeToggle, "Tree Toggle" },
    ["<leader>o"] = { vim.cmd.NvimTreeFocus, "Tree Focus" },

    ["J"] = { "mzJ`z", "Bring things up" },
    ["<leader>x"] = { "<cmd>!chmod +x %<CR>", "Make Executable" },
    ["<leader>U"] = { vim.cmd.UndotreeToggle, "Open undotree" },
    ["<C-a>"] = { "gg^vG$" },

    -- open terminal with lazygit
    ["<leader>ga"] = { function ()
      require("nvterm.terminal").send("lazygit", "float") -- the 2nd argument i.e direction is optional
    end },
  },
  x = {
    ["<leader>p"] = { [["_dP]] },
  },
}

-- M.harpoon = {
--
--   n = {
--
--     ["<C-n>"] = {
--       function()
--       end,
--     },
--
--     ["<C-j>"] = {
--       function()
--       end,
--     },
--
--     ["<C-k>"] = {
--       function()
--       end,
--     },
--   },
-- }

-- only work if file is of type C
  vim.keymap.set({'n', 'v', 'i'}, "<F5>", "<cmd>!./build.sh<CR>", {desc = "Build C file"});

return M
