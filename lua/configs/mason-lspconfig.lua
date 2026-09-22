require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "ruff",
        "ty",
        "html",
        "cssls",
        "angularls",
        "vtsls",
        "eslint",
        "terraformls",
        "tailwindcss",
    },
    automatic_installation = false,
}
