local Plugin = {'jay-babu/mason-null-ls.nvim'}

Plugin.name = 'mason-null-ls'
Plugin.enabled = true
Plugin.event = 'VeryLazy'

function Plugin.config()
	require("mason").setup()
	require("mason-null-ls").setup({
		ensure_installed = {
			'autopep8',
		},
		automatic_installation = false,
		handlers = {},
	})
	local nls = require("null-ls")
	nls.setup({
		sources = {
		}
	})
end

return Plugin
