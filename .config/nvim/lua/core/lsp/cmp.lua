return {
    keymap = { preset = 'default' },

    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = 'mono'
    },

    completion = {
        accept = {
            -- experimental auto-brackets support
            auto_brackets = {
                enabled = true,
            },
        },
        menu = {
            draw = {
                treesitter = { "lsp" },
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        },
        ghost_text = {
            enabled = vim.g.ai_cmp,
        },
    },

    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true }
}
