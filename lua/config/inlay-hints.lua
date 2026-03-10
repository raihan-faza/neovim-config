local inlay = require("inlay-hints")

inlay.setup({
	commands = { enable = true }, -- Enable InlayHints commands, include `InlayHintsToggle`, `InlayHintsEnable` and `InlayHintsDisable`
	autocmd = { enable = true }, -- Enable the inlay hints on `LspAttach` event
})
