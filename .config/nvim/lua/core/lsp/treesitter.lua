local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.pest = {
    install_info = {
        url = "https://github.com/pest-parser/tree-sitter-pest", -- local path or git repo
        files = { "src/parser.c" },                              -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main",                                         -- default branch in case of git repo if different from master
        generate_requires_npm = false,                           -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false,                  -- if folder contains pre-generated src/parser.c
    },
    filetype = "pest",                                           -- if filetype does not match the parser name
}

local M = {
    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },

    ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "java",
        "rust",
        "json",
        "cpp",
        "c",
        "zig",
        "python",
        "yuck",
    },
}
return M
