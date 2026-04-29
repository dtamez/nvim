-- Override autopairs <CR> in Python because nvim-autopairs +
-- Python indentation produces incorrect indentation when expanding pairs.

local pairs = {
    ["("] = ")",
    ["["] = "]",
    ["{"] = "}",
}

local function press_enter()
    vim.api.nvim_feedkeys(
        vim.api.nvim_replace_termcodes("<CR>", true, false, true),
        "n",
        false
    )
end

vim.keymap.set("i", "<CR>", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()

    local left = line:sub(col, col)
    local right = line:sub(col + 1, col + 1)

    if col == 0 or pairs[left] ~= right then
        press_enter()
        return
    end

    local base_indent = line:match "^%s*" or ""

    local width = vim.bo.shiftwidth
    if width == 0 then
        width = vim.bo.tabstop
    end

    local inner_indent = base_indent .. string.rep(" ", width)

    vim.api.nvim_buf_set_text(
        0,
        row - 1,
        col,
        row - 1,
        col,
        { "", inner_indent, base_indent }
    )

    vim.api.nvim_win_set_cursor(0, { row + 1, #inner_indent })
end, {
    buffer = true,
    desc = "Python pair-aware newline",
})
