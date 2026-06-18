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

    -- Completion (toggle between blink and nvim.cmp)
    {
        "saghen/blink.cmp",
        cond = function()
            return vim.g.use_blink
        end,
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = function()
            return require "configs.blink"
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        cond = function()
            return not vim.g.use_blink
        end,
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require "configs.cmp" -- your existing config
        end,
    },
    -- autopairs (for blink)
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require "configs.autopairs"
        end,
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
        "SCJangra/table-nvim",
        ft = "markdown",
        opts = require "configs.table",
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
    -- Auto-session
    {
        "rmagatti/auto-session",
        lazy = false,
        opts = {
            auto_restore = true,
            auto_save = true,
            auto_create = true,

            pre_save_cmds = {
                function()
                    pcall(vim.cmd, "NvimTreeClose")
                end,
            },
            post_restore_cmds = {
                function()
                    vim.defer_fn(function()
                        vim.cmd "filetype detect"

                        pcall(function()
                            require("nvim-tree.api").tree.open()
                        end)

                        vim.cmd "redraw!"
                    end, 100)
                end,
            },

            suppressed_dirs = {
                "~/",
                "~/Downloads",
                "/",
            },
        },
    },
    -- Twilight
    {
        "folke/twilight.nvim",
        opts = {},
    },
}
