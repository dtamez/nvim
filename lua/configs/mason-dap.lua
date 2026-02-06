require("mason-nvim-dap").setup {
    ensure_installed = {
        "python", -- debugpy
        "codelldb", -- Rust & C++
        "delve", -- Go
    },

    automatic_installation = false, -- explicit control
}
