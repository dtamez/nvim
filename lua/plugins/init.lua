return {
    -- LSP
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lsp"
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        cmd = "Mason",
        config = true,
    },

    -- Linters
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.lint"
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require "configs.mason-lint"
        end,
    },

    -- Formatters
    {
        "stevearc/conform.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require "configs.conform"
        end,
    },
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require "configs.mason-conform"
        end,
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "css",
                "csv",
                "dockerfile",
                "go",
                "graphql",
                "hcl",
                "html",
                "htmldjango",
                "java",
                "javascript",
                "jinja",
                "json",
                "lua",
                "luadoc",
                "make",
                "markdown",
                "printf",
                "python",
                "rust",
                "sql",
                "terraform",
                "toml",
                "tmux",
                "vim",
                "vimdoc",
                "yaml",
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    -- DAP
    {
        "mfussenegger/nvim-dap",
        config = function()
            require "configs.dap"
        end,
    },
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        config = function()
            require "configs.mason-dap"
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
    },
    -- Database tooling (dadbod)
    {
        "tpope/vim-dadbod",
        cmd = {
            "DB",
            "DBUI",
            "DBUIToggle",
            "DBUIAddConnection",
            "DBUIFindBuffer",
        },
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        dependencies = { "tpope/vim-dadbod" },
        cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
        init = function()
            -- optional: keep UI tidy
            vim.g.db_ui_save_location = vim.fn.stdpath "data" .. "/db_ui"
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        dependencies = { "tpope/vim-dadbod" },
        ft = { "sql", "mysql", "plsql" },
    },
    -- Folding
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufReadPost",
        config = function()
            require "configs.folding"
        end,
    },

    -- Tables in markdown
    {
        "Kicamon/markdown-table-mode.nvim",
        config = function()
            require "configs.markdown-tables"
        end,
    },

    -- Lazygit
    {
        "kdheepak/lazygit.nvim",
        -- lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        keys = {
            { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require "configs.lazygit"
        end,
    },
}
