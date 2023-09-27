local Plugins = {
	{ 'tpope/vim-fugitive' },
	{ 'wellle/targets.vim' },
	{ 'tpope/vim-repeat' },
	{ 'christoomey/vim-tmux-navigator' },
	-- { 'kyazdani42/nvim-web-devicons',   lazy = true },
	{ 'nvim-tree/nvim-web-devicons' },
	{ 'mg979/vim-visual-multi' },
	{ 'vimpostor/vim-tpipeline' },
	{ 'vim-scripts/CycleColor' },
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		'max397574/better-escape.nvim',
		opts = { mapping = { "jk" }, timeout = 100, keys = "<ESC>" }
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = { disable_filetype = { "TelescopePrompt", "vim" }, checkts = true } -- this is equalent to setup({}) function
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"jose-elias-alvarez/null-ls.nvim",
		}
	},
	{
		'numToStr/Comment.nvim',
		config = true,
		event = 'VeryLazy',
		init = function()
			vim.keymap.set('n', '<leader>/', function() require("Comment.api").toggle.linewise.current() end)
			vim.keymap.set('v', '<leader>/',
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
		end
	},
	{
		'ThePrimeagen/harpoon',
		init = function()
			local mark = require('harpoon.mark')
			local ui = require('harpoon.ui')

			vim.keymap.set('n', '<leader>a', mark.add_file)
			vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

			vim.keymap.set('n', '<C-p>', function() ui.nav_next() end)
			vim.keymap.set('n', '<C-g>', function() ui.nav_prev() end)
		end
	},

	-- Themes
	-- { 'notken12/base46-colors' },
	{ 'Mofiqul/vscode.nvim', opts = { transparent = true, italic_comments = true, disable_nvimtree_bg = true } },
	-- { 'gmr458/vscode_dark_modern.nvim' },
	-- { 'dasupradyumna/midnight.nvim',                                                                     priority = 1000 },
	-- { 'decaycs/decay.nvim' },
	-- { 'projekt0n/github-nvim-theme' },
	-- { 'folke/tokyonight.nvim' },
	-- { 'tiagovla/tokyodark.nvim' },
	-- { 'joshdick/onedark.vim' },
	-- { 'tanvirtin/monokai.nvim' },
	-- { 'challenger-deep-theme/vim' },
	-- { 'lunarvim/darkplus.nvim' },
	-- { 'martinsione/darkplus.nvim' },
}

return Plugins
