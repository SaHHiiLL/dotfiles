local u = require("core.utils")

-- Open Floating terminal
u.Nmap("<A-i>", "<cmd>ToggleTerm direction=float<cr>", "Open Floating Term")
u.Tmap("<A-i>", "<cmd>ToggleTermToggleAll<cr>", "Open Floating Term")
