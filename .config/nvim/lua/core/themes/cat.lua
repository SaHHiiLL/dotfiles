local M = {
    flavour = "mocha",
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    no_bold = true, -- Force no bold
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" },
    }
}

return M;
