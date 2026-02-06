🟢 Neovim Debug / Info Cheat Sheet
1. Environment / Health
Command	Purpose
:checkhealth	Run full Neovim health check
:checkhealth lsp	Check LSP environment
:checkhealth provider	Check Python / Node / Ruby providers
:version	Show Neovim version, features, LuaJIT
:runtime	Show runtime paths used by Neovim
2. Plugins / Load State
Command	Purpose
:Lazy	Open lazy.nvim plugin UI
:Lazy profile	Show plugin load times (startup optimization)
:Lazy debug	Inspect lazy.nvim state
:scriptnames	Show all loaded scripts (Lua + Vimscript)
3. Keymaps / Autocmds / Options
Command	Purpose
:map / :nmap / :vmap	Show key mappings
:verbose map <key>	Show where a mapping came from
:autocmd	List all autocommands
:autocmd BufWritePre	Show BufWritePre commands (save hooks)
:verbose set <option>?	Show value and origin of an option
4. LSP / Language Server
Command	Purpose
:LspInfo	Show attached LSPs, root dirs, commands, capabilities
:LspLog	Open $HOME/.local/state/nvim/lsp.log
:LspRestart	Restart all LSP clients
:lua vim.lsp.get_active_clients()	Inspect active LSP clients
:lua vim.lsp.buf.server_ready()	Check if LSP is ready for buffer
:lua vim.lsp.buf.code_action()	Trigger code actions (manual)
:lua vim.lsp.buf.format({ filter = function(client) return client.name=="ruff" end })	Format with a specific LSP client
5. Diagnostics
Command	Purpose
:lua vim.diagnostic.open_float()	Show diagnostics in a floating window
:lua vim.diagnostic.get()	Get all current diagnostics programmatically
:lua vim.diagnostic.config()	Inspect diagnostic display config
6. Formatting / Conform / Null-ls
Command	Purpose
:ConformInfo	Show active Conform formatters, format-on-save status
:NullLsInfo	Show null-ls sources (if used)
:lua require("conform").format({ async = true })	Manually trigger Conform formatting (debugging)
7. Messages / Logs / Errors
Command	Purpose
:messages	Show recent messages and warnings (hidden errors)
:checkhealth	Also reports plugin warnings
:verbose	Adds origin info for options / mappings / autocmds
8. Completion / UI Debug
Command	Purpose
:lua vim.fn.complete_info()	Inspect completion state
:Telescope diagnostics	Show all current diagnostics (if Telescope installed)
💡 Practical debugging workflow

:checkhealth → basic environment sanity

:LspInfo → confirm attached servers + root dir + command

:ConformInfo → confirm formatters and format-on-save

Open a Python file with known lint/format issues → :lua vim.diagnostic.open_float()

Save file → ensure Conform actually formats

:messages → catch any silent failures

:scriptnames + :verbose set ...? → track overrides / conflicts
