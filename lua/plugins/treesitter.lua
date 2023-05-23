-- import treesitter plugin safely
local setup, treesitter = pcall(require, "nvim-treesitter.configs")
if not setup then
  return
end

-- configure telescope
treesitter.setup({
    ensure_installed = { "python",
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
                        "yaml"
                    },
    auto_install = true,
})

