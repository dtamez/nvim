require("mason-conform").setup {
    ensure_installed = {
        -- Lua
        "stylua",

        -- Python
        "ruff",

        -- Web
        "prettierd",

        -- Terraform
        "terraform_fmt",

        -- Rust
        "rustfmt",

        -- Go
        "gofumpt",

        -- C/C++
        "clang_format",
    },

    automatic_installation = false,
}
