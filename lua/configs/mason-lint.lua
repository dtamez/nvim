require("mason-nvim-lint").setup {
    ensure_installed = {
        "luacheck", -- Lua
        "ruff", -- Python
        "djlint", -- Django templates
        "tflint", -- Terraform
        "yamllint", -- YAML
    },
    automatic_installation = false,
}
