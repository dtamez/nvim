local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_format" },
        html = { "prettierd" },
        css = { "prettierd" },
        javascript = { "prettierd" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt" },
        htmldjango = { "djlint" },
        go = { "gofumpt", "goimports-reviser", "golines" },
        terraform = { "terraform_fmt" },
    },

    formatters = {
        stylua = {
            prepend_args = {
                "--indent-width",
                "4",
                "--column-width",
                "80",
                "--quote-style",
                "AutoPreferDouble",
            },
        },
        ruff_format = {},
        prettierd = { prepend_args = { "--tab-width", "2" } }, -- default for HTML/CSS/JS
        djlint = {}, -- default settings
        ["clang-format"] = {
            prepend_args = { "-style={IndentWidth:4,TabWidth:4,UseTab:Never}" },
        },
        golines = { prepend_args = { "--max-len=80" } },
    },

    format_on_save = { timeout_ms = 500, lsp_fallback = true },
}

require("conform").setup(options)
