-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- import mason-nvim-dap plugin safely
local mason_nvim_dap_status, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not mason_nvim_dap_status then
	return
end

-- enable mason
mason.setup()

mason_nvim_dap.setup({
	-- list of servers for mason to install
	ensure_installed = { "cppdbg" },
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
	handlers = {},
})

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		--"tsserver", -- Java
		"html", -- HTML
		"cssls", -- CSS
		"lua_ls", -- Lua
		"bashls", -- Bash
		"dockerls", -- Docker
		"docker_compose_language_service", -- Docker Compose
		"pyright", -- Python
		"jsonls", -- Json
		"yamlls", -- YAML
		"clangd", -- C++
	},
	-- auto-install configured servers (with lspconfig)
	automatic_installation = true, -- not the same as ensure_installed
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"clang-format", -- C formater
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
