require("bufferline").setup({
	options = {
		buffer_close_icon = "",
		mode = "buffers",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				separator = true,
				padding = 1,
			},
		},
		diagnostics = "nvim_lsp",
		indicator = {
			-- icon = "  ", -- this should be omitted if indicator style is not 'icon'
			icon = " ● ",
			style = "icon",
		},
		-- separator_style = "slope",
	},
})
