local npairs = require "nvim-autopairs"

npairs.setup {
    check_ts = false,
    map_cr = false,
    fast_wrap = {},
    disable_filetype = { "TelescopePrompt", "vim" },
}
