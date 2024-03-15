vim.o.timeout = true
vim.o.timeoutlen = 500
local wk = require("which-key")
local mappings = {
	-- Python
	p = { ":w<CR> :FloatermNew --height=0.9 --width=0.9 --autoclose=0 python %<CR>", "Run python script" },
	--LazyGit
	l = { ":w<CR> :FloatermNew --height=0.9 --width=0.9 --autoclose=2 lazygit<CR>", "Launch LazyGit" },

	--Debuger
	d = "Debug",
	dd = { ":lua require('dapui').toggle()<CR>", "Start debugging" },
	db = { ":lua require'dap'.toggle_breakpoint()<CR>", "Set brealpoint" },
	dB = { ":lua require'dap'.set_breakpoint(vim.fn.input('Condition: '), nil, nil)<CR>", "Conditional breakpoint" },
	dc = { ":lua require'dap'.continue()<CR>", "Debug continue" },
	dO = { ":lua require'dap'.step_over()<CR>", "Debug step over" },
	di = { ":lua require'dap'.step_into()<CR>", "Debug step into" },
	ds = { ":lua require'dap'.repl.open()<CR>", "Debug inspect state" },

	--Telescope
	f = "Telescope",

	--bufferline
	b = { ":BufferLinePickClose<CR>", "Close buffer" },
}

local opts = { prefix = "<leader>" }

wk.register(mappings, opts)
