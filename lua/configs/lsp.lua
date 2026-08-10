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

-- TypeScript / JavaScript
-- vtsls replaces ts_ls; enabling both would produce duplicate diagnostics.
vim.lsp.config("vtsls", { capabilities = capabilities })

-- Angular templates and Angular-specific TypeScript features. The stock
-- angularls config locates the project's Angular and TypeScript packages.
vim.lsp.config("angularls", { capabilities = capabilities })

-- Only starts in projects with an ESLint configuration, so projects that do
-- not use ESLint remain unaffected.
vim.lsp.config("eslint", { capabilities = capabilities })

-- Tailwindcss
require "configs.tailwind"

-- SQL
vim.lsp.config("sqls", { capabilities = capabilities })

-- Java
vim.lsp.config("jdtls", {
    capabilities = capabilities,
})

-- json
vim.lsp.config("jsonls", {
    settings = {
        json = {
            validate = {
                enable = true,
            },
            format = {
                enable = false,
            },
            schemas = require("schemastore").json.schemas(),
        },
    },
})

vim.lsp.enable "jsonls"

vim.lsp.enable {
    "lua_ls",
    "ruff",
    "ty",
    "html",
    "vtsls",
    "angularls",
    "eslint",
    "cssls",
    "terraformls",
    "rust_analyzer",
    "clangd",
    "gopls",
    "tailwindcss",
    "sqls",
    "jdtls",
}
