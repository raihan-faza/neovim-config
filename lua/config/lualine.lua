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

local gruvbox_light_hard = {
	normal = {
		a = { fg = "#fbf1c7", bg = "#af3a03", gui = "bold" }, -- light fg, strong red/orange
		b = { fg = "#3c3836", bg = "#ebdbb2" },
		c = { fg = "#504945", bg = "#f9f5d7" },
	},
	insert = {
		a = { fg = "#fbf1c7", bg = "#79740e", gui = "bold" }, -- green
	},
	visual = {
		a = { fg = "#fbf1c7", bg = "#076678", gui = "bold" }, -- blue
	},
	replace = {
		a = { fg = "#fbf1c7", bg = "#9d0006", gui = "bold" }, -- red
	},
	command = {
		a = { fg = "#fbf1c7", bg = "#8f3f71", gui = "bold" }, -- purple
	},
	inactive = {
		a = { fg = "#a89984", bg = "#f9f5d7" },
		b = { fg = "#a89984", bg = "#f9f5d7" },
		c = { fg = "#bdae93", bg = "#f9f5d7" },
	},
}

local gruvbox_dark_hard = {
	normal = {
		a = { fg = "#1d2021", bg = "#fb4934", gui = "bold" }, -- dark bg, bright red
		b = { fg = "#ebdbb2", bg = "#3c3836" },
		c = { fg = "#a89984", bg = "#1d2021" },
	},
	insert = {
		a = { fg = "#1d2021", bg = "#b8bb26", gui = "bold" }, -- green
	},
	visual = {
		a = { fg = "#1d2021", bg = "#83a598", gui = "bold" }, -- blue
	},
	replace = {
		a = { fg = "#1d2021", bg = "#fb4934", gui = "bold" }, -- red
	},
	command = {
		a = { fg = "#1d2021", bg = "#d3869b", gui = "bold" }, -- purple
	},
	inactive = {
		a = { fg = "#7c6f64", bg = "#1d2021" },
		b = { fg = "#7c6f64", bg = "#1d2021" },
		c = { fg = "#665c54", bg = "#1d2021" },
	},
}

require("lualine").setup({
	options = {
		theme = gruvbox_dark_hard,
		icons_enabled = false,
		component_separators = "👉👈",
		section_separators = "👉👈",
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
