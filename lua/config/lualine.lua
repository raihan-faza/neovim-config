local mono = {
	normal = {
		a = { fg = "#ffffff", bg = "#000000", gui = "bold" },
		b = { fg = "#aaaaaa", bg = "#000000" },
		c = { fg = "#888888", bg = "#000000" },
	},
	insert = {
		a = { fg = "#ffffff", bg = "#000000", gui = "bold" },
	},
	visual = {
		a = { fg = "#ffffff", bg = "#000000", gui = "bold" },
	},
	replace = {
		a = { fg = "#ffffff", bg = "#000000", gui = "bold" },
	},
	command = {
		a = { fg = "#ffffff", bg = "#000000", gui = "bold" },
	},
	inactive = {
		a = { fg = "#666666", bg = "#000000" },
		b = { fg = "#666666", bg = "#000000" },
		c = { fg = "#666666", bg = "#000000" },
	},
}

require("lualine").setup({
	options = {
		theme = mono,
		icons_enabled = false,
		component_separators = "",
		section_separators = "",
		globalstatus = true,
	},

	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { "filename" },

		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},

	inactive_sections = {
		lualine_c = { "filename" },
		lualine_x = { "location" },
	},
})
