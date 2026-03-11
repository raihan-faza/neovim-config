local capabilities = require("cmp_nvim_lsp").default_capabilities()
local luasnip = require("luasnip")
local navic = require("nvim-navic")

-- Shared LSP attach
local lsp_on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end
end

-- Simple servers
local servers = {
	"pyright",
	"gopls",
	"emmet_ls",
	"biome",
	"phpactor",
	"clangd",
	"lua_ls",
	"css_variables",
	"svelte",
	"solidity_ls_nomicfoundation",
	"tailwindcss",
}

for _, server in ipairs(servers) do
	vim.lsp.config(server, {
		capabilities = capabilities,
		on_attach = lsp_on_attach,
	})
	vim.lsp.enable(server)
end

-- Dart
vim.lsp.config("dartls", {
	capabilities = capabilities,
	on_attach = lsp_on_attach,
	settings = {
		dart = {
			closingLabels = true,
			flutterOutline = true,
			onlyAnalyzeProjectsWithOpenFiles = true,
			outline = true,
			suggestFromUnimportedLibraries = true,
		},
	},
})
vim.lsp.enable("dartls")

-- TypeScript / JavaScript
vim.lsp.config("ts_ls", {
	capabilities = capabilities,
	filetypes = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		lsp_on_attach(client, bufnr)
	end,
})
vim.lsp.enable("ts_ls")

-- ESLint
vim.lsp.config("eslint", {
	capabilities = capabilities,
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
	},
	on_attach = lsp_on_attach,
})
vim.lsp.enable("eslint")

-- ========================
-- nvim-cmp setup
-- ========================

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),

		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),

		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),

		["<CR>"] = cmp.mapping.confirm({ select = false }),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { "i", "s" }),
	}),

	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
	}),
})

require("luasnip.loaders.from_vscode").lazy_load()
