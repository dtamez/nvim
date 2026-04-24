-- global fold settings
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

-- setup ufo
require("ufo").setup {
    provider_selector = function(_, ft, bt)
        if bt ~= "" then
            return ""
        end

        if ft == "python" then
            return { "indent" }
        end

        return { "treesitter", "indent" }
    end,
}
