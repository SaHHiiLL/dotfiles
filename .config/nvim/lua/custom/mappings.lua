local M = {}

-- local builtin = require "telescope.builtin"

M.telescope = {
  plugin = true,
  n = {
    ["<leader>tf"] = { "<cmd>Telescope find_files<CR>", "File files" },
    ["<leader>ts"] = { "<cmd>Telescope spell_suggest<CR>", "spell suggest" },
    ["<leader>tg"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },
    ["<leader>th"] = { "<cmd>Telescope help_tags<CR>", "Help page" },
    ["<leader>to"] = { "<cmd>Telescope oldfiles<CR>", "Find oldfiles" },

    ["<leader>lr"] = { "<cmd>Telescope lsp_references<CR>", "LSP references" },
    ["<leader>li"] = { "<cmd>Telescope lsp_implementations<CR>", "Impls" },

    -- git
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "Git commits" },

    -- theme switcher
    ["<leader>tl"] = { "<cmd>Telescope themes<CR>", "Nvchad themes" },
  },
}

M.lspconfig = {
  plugin = true,
  n = {
    ["<leader>lh"] = { vim.lsp.buf.hover, "lsp hover" },
    ["<leader>ld"] = { vim.diagnostic.open_float, "lsp diagnostic" },
    ["<leader>la"] = { vim.lsp.buf.code_action, "quick action" },
    ["<leader>lp"] = { vim.lsp.buf.rename, "lsp rename" },
    ["<leader>lu"] = { vim.lsp.buf.references, "lsp references" },
    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp format",
    },
  },
}

M.general = {
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move things Up" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move things Down" },
  },
  n = {
    ["<leader>e"] = { vim.cmd.NvimTreeToggle, "Tree Toggle" },
    ["<leader>o"] = { vim.cmd.NvimTreeFocus, "Tree Focus" },

    ["J"] = { "mzJ`z", "Bring things up" },
    ["<leader>x"] = { "<cmd>!chmod +x %<CR>", "Make Executable" },
    ["<leader>U"] = { vim.cmd.UndotreeToggle, "Open undotree" },
    ["<C-a>"] = { "gg^vG$" },
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

return M
