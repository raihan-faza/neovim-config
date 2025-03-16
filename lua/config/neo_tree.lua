-- Keybinding to toggle Neo-tree and focus on it
vim.keymap.set("n", "<leader>b", function()
	require("neo-tree.command").execute({ toggle = true, focus = true })
end, { noremap = true, silent = true })

-- Keybinding to open Neo-tree in floating window
vim.keymap.set("n", "<leader>o", function()
	require("neo-tree.command").execute({ toggle = true, position = "float" })
end, { noremap = true, silent = true })

-- Auto close Neo-tree when it's the last window
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "neo-tree" then
			vim.cmd("quit")
		end
	end,
})

-- Enable diagnostics in Neo-tree
require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			visible = true, -- Show hidden files
		},
		follow_current_file = true, -- Auto-focus on the file you're editing
	},
	window = {
		width = 30,
		mappings = {
			["l"] = "open",
			["h"] = "close_node",
		},
	},
	default_component_configs = {
		diagnostics = {
			symbols = {
				hint = "",
				info = "",
				warn = "",
				error = "",
			},
			highlights = {
				hint = "DiagnosticHint",
				info = "DiagnosticInfo",
				warn = "DiagnosticWarn",
				error = "DiagnosticError",
			},
		},
	},
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" }) -- Auto close Neo-tree when opening a file
			end,
		},
	},
})
