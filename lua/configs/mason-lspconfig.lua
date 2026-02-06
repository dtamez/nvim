require("mason-lspconfig").setup {
    ensure_installed = {
        "lua_ls",
        "ruff",
        "ty",
        "html",
        "cssls",
        "terraformls",
        "rust_analyzer",
        "clangd",
        "gopls",
    },
    automatic_installation = false,
}
