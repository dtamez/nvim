require("mason-nvim-lint").setup {
    ensure_installed = {
        "luacheck", -- Lua
        "ruff", -- Python
        "djlint", -- Django templates
        "tflint", -- Terraform
    },
    automatic_installation = false,
}
