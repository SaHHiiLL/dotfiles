local M = {
    flavour = "mocha",
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    no_bold = false, -- Force no bold
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },
    },
    color_overrides = {
        mocha = {
            -- base = '#11111b'
                base = '#090911'
        }
    }
}

return M;
