-- Make sure lazygit binary exists
if vim.fn.executable "lazygit" == 0 then
    return
end

-- Floating window defaults (clean + practical)
vim.g.lazygit_floating_window_winblend = 0
vim.g.lazygit_floating_window_scaling_factor = 0.9
vim.g.lazygit_floating_window_corner_chars = { "╭", "╮", "╰", "╯" }

-- Optional: use full screen instead of float
-- vim.g.lazygit_floating_window_use_plenary = 0

-- Optional: border style
vim.g.lazygit_floating_window_border_chars =
    { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

-- Keymap (recommended)
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })
