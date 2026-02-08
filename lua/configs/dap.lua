local dap_ok, dap = pcall(require, "dap")
local dapui_ok, dapui = pcall(require, "dapui")

if not (dap_ok and dapui_ok) then
    vim.notify("dap or dapui not installed", vim.log.levels.WARN)
    return
end

------------------------------------------------------------
-- DAP UI setup
------------------------------------------------------------
dapui.setup()

------------------------------------------------------------
-- Keymaps (generic for all languages)
------------------------------------------------------------
local map_opts = { noremap = true, silent = true }

-- DAP UI toggle
vim.keymap.set(
    "n",
    "<leader>du",
    dapui.toggle,
    vim.tbl_extend("force", { desc = "DAP: Toggle UI" }, map_opts)
)

-- Common debugging actions
vim.keymap.set(
    "n",
    "<leader>db",
    dap.toggle_breakpoint,
    vim.tbl_extend("force", { desc = "DAP: Toggle Breakpoint" }, map_opts)
)
vim.keymap.set(
    "n",
    "<leader>dc",
    dap.continue,
    vim.tbl_extend("force", { desc = "DAP: Continue" }, map_opts)
)
vim.keymap.set(
    "n",
    "<leader>di",
    dap.step_into,
    vim.tbl_extend("force", { desc = "DAP: Step Into" }, map_opts)
)
vim.keymap.set(
    "n",
    "<leader>do",
    dap.step_over,
    vim.tbl_extend("force", { desc = "DAP: Step Over" }, map_opts)
)
vim.keymap.set(
    "n",
    "<leader>dui",
    dapui.eval,
    vim.tbl_extend("force", { desc = "DAP: Evaluate" }, map_opts)
)
vim.keymap.set(
    "n",
    "<leader>dr",
    dap.repl.open,
    vim.tbl_extend("force", { desc = "DAP: REPL open" }, map_opts)
)
vim.keymap.set(
    "n",
    "<F5>",
    dap.continue,
    vim.tbl_extend("force", { desc = "DAP: Start or Continue" }, map_opts)
)
vim.keymap.set(
    "n",
    "<F6>",
    dap.step_over,
    vim.tbl_extend("force", { desc = "DAP: Step over Line" }, map_opts)
)
vim.keymap.set(
    "n",
    "<F7>",
    dap.step_into,
    vim.tbl_extend("force", { desc = "DAP: Step into Line" }, map_opts)
)
vim.keymap.set(
    "n",
    "<F8>",
    dap.step_out,
    vim.tbl_extend("force", { desc = "DAP: Step out of Line" }, map_opts)
)
-- vim.keymap.set(
--     "n",
--     "<leader>dq",
--     dap.Quit,
--     vim.tbl_extend("force", { desc = "DAP: Quit" }, map_opts)
-- )

------------------------------------------------------------
-- Auto-open / close DAP UI
------------------------------------------------------------
local listeners_id = "dapui_config"

dap.listeners.after.attach[listeners_id] = function()
    dapui.open()
end
dap.listeners.after.launch[listeners_id] = function()
    dapui.open()
end
dap.listeners.before.event_terminated[listeners_id] = function()
    dapui.close()
end
dap.listeners.before.event_exited[listeners_id] = function()
    dapui.close()
end

------------------------------------------------------------
-- Language-specific adapters
------------------------------------------------------------

-- Python: debugpy via Mason
local mason_path = vim.fn.stdpath "data"
    .. "/mason/packages/debugpy/venv/bin/python"

require("dap-python").setup(mason_path)

-- Optional but useful:
require("dap-python").test_runner = "pytest"

dap.adapters.python = {
    type = "executable",
    command = vim.fn.stdpath "data"
        .. "/mason/packages/debugpy/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
}

-- Rust & C++: codelldb
dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath "data"
            .. "/mason/packages/codelldb/extension/adapter/codelldb",
        args = { "--port", "${port}" },
    },
}

dap.configurations.rust = {
    {
        name = "Debug executable",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/target/debug/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

dap.configurations.cpp = {
    {
        name = "Debug executable",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/build/",
                "file"
            )
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

-- Go: delve
dap.adapters.go = {
    type = "server",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath "data" .. "/mason/packages/delve/dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
    },
}

dap.configurations.go = {
    {
        type = "go",
        name = "Debug",
        request = "launch",
        program = "${file}",
    },
}
