-- import treesitter plugin safely
local setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not setup then
	return
end

-- configure telescope
treesitter.setup({
	ensure_installed = {
		"c",
		"python",
		"markdown",
		"markdown_inline",
		"vim",
		"vimdoc",
		"bash",
		"css",
		"dockerfile",
		"html",
		"json",
		"lua",
		"sql",
		"yaml",
		"diff",
		"git_rebase",
		"gitattributes",
		"passwd",
		"requirements",
		"toml",
	},
	auto_install = true,
	highlight = {
		enable = true,
	},
})
