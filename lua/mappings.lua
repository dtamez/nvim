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
    vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

map("n", "zR", function()
    require("ufo").openAllFolds()
end, { desc = "Open all folds" })

map("n", "zM", function()
    require("ufo").closeAllFolds()
end, { desc = "Close all folds" })

map("n", "zr", function()
    require("ufo").openFoldsExceptKinds()
end, { desc = "Open folds except kinds" })

-- apply command actions
vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action {
        apply = true,
    }
end)

-- find hidden files in telescope with this key sequence
vim.keymap.set("n", "<leader>fa", function()
    require("telescope.builtin").find_files {
        hidden = true,
        no_ignore = true,
    }
end)

-- auto-session
map("n", "<leader>ss", "<cmd>AutoSession save<CR>", { desc = "Save session" })
map(
    "n",
    "<leader>sr",
    "<cmd>AutoSession restore<CR>",
    { desc = "Restore session" }
)
map(
    "n",
    "<leader>sd",
    "<cmd>AutoSession delete<CR>",
    { desc = "Delete session" }
)

-- twilight
map("n", "<leader>a", "<cmd>Twilight<CR>", { desc = "Toggle twilight" })
