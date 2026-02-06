require "nvchad.mappings"

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- scroll up/down without moving the cursor
map({ "n", "i", "v" }, "<C-k>", "1<C-U>")
map({ "n", "i", "v" }, "<C-j>", "1<C-D>")

-- toggle comment
map("n", "<leader>;", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>;", "gc", { desc = "toggle comment", remap = true })

-- save all modified files on save
map("n", "<leader>w", "<cmd> wa <cr>")

-- whichkey
map("n", "<leader>K", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>k", function()
    vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })
