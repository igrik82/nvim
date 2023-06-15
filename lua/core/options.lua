-- hiliting more then 80 symbols
vim.cmd([[
augroup TooLong
    autocmd!
    autocmd winEnter,BufEnter * call clearmatches() | call matchadd('ColorColumn', '\%80v', 100)
    "highlight ColorColumn ctermbg=0 guibg=lightgrey " Lightgray hiliting cloumn
augroup END

" Uncomment the following to have Vim jump to the last position when
" reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]])

local opt = vim.opt -- for conciseness

--appearance
--opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- Splits horizontal below and vertical right
opt.splitbelow = true
opt.splitright = true

-- tabs & indentation
opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = false
opt.iskeyword:append("-")

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- dialogue asking if you wish to save changed files.
opt.confirm = true

--Sane text files
opt.fileformat = "unix"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

--Set cursorlinr and colomn
opt.cursorline = true
opt.cursorcolumn = true
