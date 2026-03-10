return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/trouble.nvim",
		"SmiteshP/nvim-navic",
	},

	opts = function(_, opts)
		local navic = require("nvim-navic")
		local trouble = require("trouble")

		local mono = {
			normal = {
				a = { fg = "#ffffff", bg = "#000000", gui = "bold" },
				b = { fg = "#aaaaaa", bg = "#000000" },
				c = { fg = "#888888", bg = "#000000" },
			},
			insert = { a = { fg = "#ffffff", bg = "#000000", gui = "bold" } },
			visual = { a = { fg = "#ffffff", bg = "#000000", gui = "bold" } },
			replace = { a = { fg = "#ffffff", bg = "#000000", gui = "bold" } },
			command = { a = { fg = "#ffffff", bg = "#000000", gui = "bold" } },
			inactive = {
				a = { fg = "#666666", bg = "#000000" },
				b = { fg = "#666666", bg = "#000000" },
				c = { fg = "#666666", bg = "#000000" },
			},
		}

		opts.options = {
			theme = mono,
			icons_enabled = false,
			component_separators = "",
			section_separators = "",
			globalstatus = true,
		}

		opts.sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch" },
			lualine_c = { "filename" },
			lualine_x = { "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		}

		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			hl_group = "lualine_c_normal",
		})

		table.insert(opts.sections.lualine_c, {
			symbols.get,
			cond = symbols.has,
		})

		table.insert(opts.sections.lualine_c, {
			function()
				return navic.get_location()
			end,
			cond = function()
				return navic.is_available()
			end,
		})

		return opts
	end,
}
