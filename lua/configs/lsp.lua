local nv_lsp = require "nvchad.configs.lspconfig"
nv_lsp.defaults()

local capabilities = vim.deepcopy(nv_lsp.capabilities)

-- Completion via blink.cmp or nvim-cmp
if vim.g.use_blink then
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)
else
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
end

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
    capabilities = capabilities,
    on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    end,
})

-- Tailwindcss
require "configs.tailwind"

-- SQL
vim.lsp.config("sqls", { capabilities = capabilities })

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
    "tailwindcss",
    "sqls",
}
