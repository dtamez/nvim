require "nvchad.options"

-- Base Neovim options
local o = vim.o

o.termguicolors = true

-- mouse
o.mouse = ""

-- Base indentation (can be overridden per filetype)
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

-- Per-filetype indentation
local ft_indents = {
    -- Python
    python = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },

    -- Lua
    lua = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },

    -- HTML / Django templates
    html = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
    htmldjango = {
        shiftwidth = 2,
        tabstop = 2,
        softtabstop = 2,
        expandtab = true,
        -- foldmethod = "syntax",
    },

    -- CSS / JavaScript
    css = { shiftwidth = 2, tabstop = 2, softtabstop = 2, expandtab = true },
    javascript = {
        shiftwidth = 2,
        tabstop = 2,
        softtabstop = 2,
        expandtab = true,
    },

    -- Go
    go = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },

    -- C / C++
    c = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },
    cpp = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },

    -- Rust
    rust = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },

    -- Terraform
    terraform = {
        shiftwidth = 4,
        tabstop = 4,
        softtabstop = 4,
        expandtab = true,
    },
}

for ft, opts in pairs(ft_indents) do
    vim.api.nvim_create_autocmd("FileType", {
        pattern = ft,
        callback = function()
            for k, v in pairs(opts) do
                vim.bo[k] = v
            end
        end,
    })
end
