local M = {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      local opts = require("core.themes.cat")
      require("catppuccin").setup(opts)
      --TODO: make something similar to NvChad theme picker
    end
  },
}
return M
