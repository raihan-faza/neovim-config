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
opt.colorcolumn = "120"
cmd("colorscheme monochrome")
-- require("gruvbox").setup({
-- 	contrast = "soft", -- Optional, can be "soft", "medium", or "hard"
-- 	palette_overrides = {}, -- Optional, customize Gruvbox colors
-- 	overrides = {}, -- Optional, tweak highlight groups
-- })

vim.wo.relativenumber = false
-- vim.opt.laststatus = 0
-- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#b8b611", bg = "#1c1c1b" }) -- Active statusline
-- vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#1c241a", bg = "#1c1c1b" }) -- Inactive statusline
-- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })

vim.diagnostic.config({
	virtual_text = true, -- inline messages
	signs = true, -- show in gutter
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
vim.opt.listchars = { tab = "| " }
