vim.filetype.add {
    extension = {
        htmldjango = "htmldjango",
    },
    pattern = {
        [".*%.html"] = function(_, bufnr)
            if vim.fs.root(bufnr, { "angular.json", "nx.json" }) then
                return "htmlangular"
            end

            return "htmldjango"
        end,
    },
}
