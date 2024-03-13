local Plugin = { 'nvim-telescope/telescope.nvim' }

Plugin.dependencies = {
	{ 'nvim-lua/plenary.nvim' },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
}

Plugin.cmd = { 'Telescope' }

Plugin.opts = {
	pickers = {
		-- find_files = {
		-- 	theme = 'dropdown'
		-- },
		-- diagnostics = {
		-- 	theme = 'dropdown'
		-- },
		buffers = {
			sort_mru = true,
		}
	},
	extensions = {
		file_browser = {
			hijack_netrw = true,
			theme = 'dropdown'
		}
	},
}

function Plugin.init()
	-- See :help telescope.builtin
	vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<CR>')
	vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<CR>')
	vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
	vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
	vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>')
	vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
	vim.keymap.set('n', '<leader>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')
	vim.keymap.set('n', '<leader>fS', ':Telescope lsp_document_symbols<CR>')
	require('telescope').load_extension('fzf')
	require("telescope").load_extension('file_browser')
end

-- function Plugin.config()
-- 	require('telescope').load_extension('fzf')
-- 	require("telescope").load_extension('file_browser')
-- end

return Plugin
