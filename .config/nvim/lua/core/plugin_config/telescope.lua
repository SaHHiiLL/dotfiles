local u = require("core.utils")

-- Settins keys maps for Telescopt

u.Nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", "File Finder")
u.Nmap("<leader>fw", "<cmd>Telescope grep_string<CR>", "Live Grep")

u.Nmap("<leader>gc", "<cmd>Telescope git_commits<CR>", "Git Commits")

local M = {}

M = {
pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

return M
