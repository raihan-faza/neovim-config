local opt = vim.opt
local cmd = vim.cmd
opt.fillchars = { eob = " " }
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = true
opt.number = true
opt.guicursor = "n-v-i-c:thin-Cursor"
--opt.signcolumn = "no"
opt.clipboard = "unnamedplus"
opt.background = "dark" -- Set to "dark" or "light" based on your preference
require("gruvbox").setup({
	contrast = "hard", -- Optional, can be "soft", "medium", or "hard"
	palette_overrides = {}, -- Optional, customize Gruvbox colors
	overrides = {}, -- Optional, tweak highlight groups
})
cmd("colorscheme gruvbox")
vim.wo.relativenumber = true
-- vim.opt.laststatus = 0
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#b8b611", bg = "#1c1c1b" }) -- Active statusline
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#1c241a", bg = "#1c1c1b" }) -- Inactive statusline
