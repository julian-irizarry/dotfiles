local Plugin = { 'lukas-reineke/indent-blankline.nvim' }

Plugin.name = 'indent_blankline'

Plugin.main = 'ibl'

-- See :help indent-blankline-setup
Plugin.opts = {
	indent = { char = '▏' },
	scope = {
		-- show_first_indent_level = false,
		enabled = false
		-- show_trailing_blankline_indent = false,
		-- show_first_indent_level = false,
		-- use_treesitter = true,
		-- jushow_current_context = false
	}
}

return Plugin
