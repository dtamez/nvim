require "nvchad.options"

-- Base Neovim options
local o = vim.o

o.termguicolors = true

-- Base indentation (applies to all buffers by default)
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.expandtab = true

-- Per-filetype indentation (defaults, before HTML/Django changes)
local ft_indents = {
    python = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },
    lua = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },
    html = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },
    htmldjango = {
        shiftwidth = 4,
        tabstop = 4,
        softtabstop = 4,
        expandtab = true,
    },
    css = { shiftwidth = 4, tabstop = 4, softtabstop = 4, expandtab = true },
    javascript = {
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
