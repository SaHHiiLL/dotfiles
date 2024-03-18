local u = require("core.utils")

-- Settins keys maps for Telescopt

u.Nmap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", "File Finder")
u.Nmap("<leader>fw", "<cmd>Telescope git_commits<CR>", "Live Grep")

