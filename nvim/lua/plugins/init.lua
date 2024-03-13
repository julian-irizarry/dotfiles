local Plugins = {
	{ 'tpope/vim-fugitive' },
	{ 'wellle/targets.vim' },
	{ 'tpope/vim-repeat' },
	{ 'christoomey/vim-tmux-navigator' },
	-- { 'kyazdani42/nvim-web-devicons',   lazy = true },
	{ 'nvim-tree/nvim-web-devicons' },
	{ 'mg979/vim-visual-multi' },
	{ 'vimpostor/vim-tpipeline' },
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
	{
		'nvimdev/lspsaga.nvim',
		config = function()
			require('lspsaga').setup({})
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter',
			'nvim-tree/nvim-web-devicons'
		},
		init = function()
			vim.keymap.set('n', '<leader>d', '<cmd> Lspsaga peek_definition <CR>', { desc = 'peek at definition' })
		end
	},
	{
		'sanathks/workspace.nvim',
		dependencies = { 'nvim-telescope/telescope.nvim' },
		config = function()
			local workspace = require('workspace')
			workspace.setup({
				workspaces = { { name = 'projects', path = '~/Documents/projects/', keymap = { '<leader>w' } } }
			})
			vim.keymap.set('n', '<leader>ps', workspace.tmux_sessions, { desc = 'Switch betweeen tmux sessions' })
		end,
	},
	{
		'j-hui/fidget.nvim',
		tag = "legacy",
		event = "LspAttach",

	},
	-- {
	-- 	'mfussenegger/nvim-dap',
	-- 	config = function()
	-- 		vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakPoint <CR>', { desc='Add breakpont at line' })
	-- 		vim.keymap.set('n', '<leader>dr', '<cmd> DapContinue <CR>', { desc='Add breakpont at line' })
	-- 	end
	-- },
	-- {
	-- 	"jay-babu/mason-nvim-dap.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"williamboman/mason.nvim",
	-- 		"mfussenegger/nvim-dap"
	-- 	},
	-- 	opts = {
	-- 		handlers = {}
	-- 	},
	-- },
	-- {
	-- 	'rcarriga/nvim-dap-ui',
	-- 	event = 'VeryLazy',
	-- 	dependencies = 'mfussenegger/nvim-dap',
	-- 	config = function()
	-- 		local dap, dapui = require("dap"), require("dapui")
	-- 		dap.listeners.after.event_initialized["dapui_config"] = function()
	-- 			dapui.open()
	-- 		end
	-- 		dap.listeners.before.event_terminated["dapui_config"] = function()
	-- 			dapui.close()
	-- 		end
	-- 		dap.listeners.before.event_exited["dapui_config"] = function()
	-- 			dapui.close()
	-- 		end
	-- 	end,
	-- 	opts = {
	-- 		plugin = true,
	-- 		n = {
	-- 			['<leader>db'] = {
	-- 				'<cmd> DapToggleBreakPoint <CR>',
	-- 				'Add breakpoint at line',
	-- 			},
	-- 			['<leader>dr'] = {
	-- 				'<cmd> DapContinue <CR>',
	-- 				'Start or continue the debugger',
	-- 			}
	-- 		}
	-- 	}
	-- },

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
