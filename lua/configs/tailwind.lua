vim.lsp.config("tailwindcss", {
    filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "htmldjango",
        "django-html",
        "templ",
    },

    init_options = {
        userLanguages = {
            ["htmldjango"] = "html",
            ["django-html"] = "html",
        },
    },

    settings = {
        tailwindCSS = {
            validate = true,

            experimental = {
                classRegex = {
                    'class\\s*=\\s*"([^"]*)"',
                    'class:\\s*"([^"]*)"',
                    "tw`([^`]*)",
                    'tw="([^"]*)"',
                    'tw={"([^"]*)"}',
                },
            },

            lint = {
                cssConflict = "warning",
                invalidApply = "error",
                invalidScreen = "error",
                invalidVariant = "error",
                invalidConfigPath = "error",
                invalidTailwindDirective = "error",
                recommendedVariantOrder = "warning",
            },
        },
    },
})
