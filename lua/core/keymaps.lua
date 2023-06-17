vim.g.mapleader = " "

local keymap = vim.keymap

--Resize windows in vertical split
keymap.set("n", "<C-h>", ":vertical resize -10<CR>")
keymap.set("n", "<C-l>", ":vertical resize +10<CR>")
keymap.set("n", "<C-k>", ":resize -2<CR>")
keymap.set("n", "<C-j>", ":resize +2<CR>")

--Nvim tree
keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

--Telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

--Debuger
--keymap.set("n", "<C-d>", ":lua require('dapui').toggle()<CR>") -- Start debugging
--keymap.set("n", "<C-b>", ":lua require'dap'.toggle_breakpoint()<CR>") -- Setting breakpoints
--keymap.set("n", "<leader>b", ":lua require'dap'.set_breakpoint(vim.fn.input('Condition: '), nil, nil)<CR>") -- Setting conditional breakpoints
--keymap.set("n", "<C-c>", ":lua require'dap'.continue()<CR>") -- Launching debug sessions
--keymap.set("n", "<C-o>", ":lua require'dap'.step_over()<CR>") -- Step over
--keymap.set("n", "<C-i>", ":lua require'dap'.step_into()<CR>") -- Step into
--keymap.set("n", "<leader>o", ":lua require'dap'.repl.open()<CR>") -- Inspecting the state

-- Execute current python file in terminal
keymap.set("n", "<leader>t", ":w<CR>:belowright split |terminal python %<CR>")
--keymap.set("n", "<leader>r", ":w<CR>:FloatermNew --height=0.9 --width=0.9 --autoclose=0 python %<CR>")

-- Copy micropython file to esp32
--keymap.set("n", "<leader>cv", ":w<CR>:! rshell --buffer-size=30 -p /dev/ttyUSB0 cp % /pyboard<CR>")

-- Execute micropython current file in esp32
--keymap.set("n", "<leader>e", ":w<CR>:! rshell --buffer-size=30 -p /dev/ttyUSB0 repl pyboard import %:r<CR>")
