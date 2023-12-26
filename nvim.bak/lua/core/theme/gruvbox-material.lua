vim.g.gruvbox_material_background = 'hard'


require("lualine").setup{
    options = {
        theme = 'gruvbox-material'
    }
}

vim.cmd('colorscheme gruvbox-material')
