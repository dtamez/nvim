return {
    -- minimal, sane defaults
    keymap = {
        preset = "super-tab", -- "default", super-tab", "enter"
    },

    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },

    completion = {
        documentation = { auto_show = true },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
            lsp = { min_keyword_length = 2 },
            snippets = { min_keyword_length = 2 },
            buffer = { min_keyword_length = 2 },
        },
    },
}
