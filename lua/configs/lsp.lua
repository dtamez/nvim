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

-- HTML
vim.lsp.config("html", {
    -- prevent LSP server from interfing with prettier
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})

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
