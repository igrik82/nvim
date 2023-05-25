require("plugins.lualine")
require("core.colorscheme")
require("core.keymaps")
require("core.options")
require("plugins-setup")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.nvim-cmp")
require("plugins.lsp.mason")
require("plugins.lsp.lspsaga")
require("plugins.lsp.lspconfig")
require("plugins.lsp.null-ls")
require("plugins.autopairs")
require("plugins.gitsigns")
require("plugins.dap-python")

vim.cmd([[
augroup TooLong
    autocmd!
    autocmd winEnter,BufEnter * call clearmatches() | call matchadd('ColorColumn', '\%80v', 100)
    "highlight ColorColumn ctermbg=0 guibg=lightgrey " Lightgray hiliting cloumn
augroup END
]])
