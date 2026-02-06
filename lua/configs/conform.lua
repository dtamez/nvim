local options = {
    ----------------------------------------------------------------
    -- Map filetypes to formatters
    ----------------------------------------------------------------
    formatters_by_ft = {
        -- Web
        html = { "prettier" },
        css = { "prettier" },
        javascript = { "prettier" },
        htmldjango = { "djlint" },

        -- Python
        python = { "ruff_format" },

        -- Lua
        lua = { "stylua" },

        -- Rust
        rust = { "rustfmt" },

        -- Go
        go = { "gofumpt", "goimports-reviser", "golines" },

        -- C / C++
        c = { "clang-format" },
        cpp = { "clang-format" },

        -- Terraform
        terraform = { "terraform_fmt" },
    },

    ----------------------------------------------------------------
    -- Formatter-specific options
    ----------------------------------------------------------------
    formatters = {
        -- Prettier for HTML/CSS/JS
        prettier = {
            prepend_args = { "--tab-width", "2" },
        },

        -- Django templates
        djlint = {
            prepend_args = { "--indent", "2" },
        },

        -- Python
        ruff_format = {},

        -- Lua
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

        -- Rust
        rustfmt = {},

        -- Go
        golines = { prepend_args = { "--max-len=80" } },

        -- C / C++
        ["clang-format"] = {
            prepend_args = { "-style={IndentWidth:4,TabWidth:4,UseTab:Never}" },
        },

        -- Other Go formatters
        gofumpt = {},
        ["goimports-reviser"] = {},
        ["terraform_fmt"] = {},
    },

    ----------------------------------------------------------------
    -- Format on save
    ----------------------------------------------------------------
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = false, -- Ensure LSP does not format instead
    },
}

require("conform").setup(options)
