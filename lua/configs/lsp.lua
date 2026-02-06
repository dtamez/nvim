local nv_lsp = require "nvchad.configs.lspconfig"
nv_lsp.defaults()

local capabilities = nv_lsp.capabilities

-- Lua
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
        },
    },
})

-- Python
vim.lsp.config("ruff", { capabilities = capabilities })
vim.lsp.config("ty", { capabilities = capabilities })

-- Enable servers
vim.lsp.enable {
    "lua_ls",
    "ruff",
    "ty",
    "html",
    "cssls",
    "terraformls",
    "rust_analyzer",
    "clangd",
    "gopls",
}
