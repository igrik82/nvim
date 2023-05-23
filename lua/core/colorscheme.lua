local status, _ = pcall(vim.cmd, "colorscheme gruvbox")
if not status then
  print("Colorscheme not found!") -- print error if colorscheme not installed
  return
end

require("gruvbox").setup({
  contrast = "soft", -- can be "hard", "soft" or empty string
})
