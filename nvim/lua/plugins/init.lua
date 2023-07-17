local Plugins = {
  {'tpope/vim-fugitive'},
  {'wellle/targets.vim'},
  {'tpope/vim-repeat'},
  {'christoomey/vim-tmux-navigator', lazy = false},
  {'kyazdani42/nvim-web-devicons', lazy = true},
  {'mg979/vim-visual-multi'},
  {'vimpostor/vim-tpipeline', lazy=false},
  {'numToStr/Comment.nvim', config = true, event = 'VeryLazy', 
    init = function ()
      vim.keymap.set('n', '<leader>/', function() require("Comment.api").toggle.linewise.current() end)
      vim.keymap.set('v', '<leader>/', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
    end
  },
  {'ThePrimeagen/harpoon',
  	init = function ()
		local mark = require('harpoon.mark')
		local ui = require('harpoon.ui')

		vim.keymap.set('n', '<leader>a', mark.add_file)
		vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

		vim.keymap.set('n', '<C-p>', function() ui.nav_next() end)
		vim.keymap.set('n', '<C-g>', function() ui.nav_prev() end)
	end
  },
  
  -- Themes
  {'notken12/base46-colors'},
  {'dasupradyumna/midnight.nvim', lazy = false, priority = 1000},
  {'decaycs/decay.nvim'},
  {'projekt0n/github-nvim-theme'},
  {'folke/tokyonight.nvim'},
  {'joshdick/onedark.vim'},
  {'tanvirtin/monokai.nvim'},
  {'challenger-deep-theme/vim'},
  -- {'lunarvim/darkplus.nvim'},
  {'martinsione/darkplus.nvim'},
}

return Plugins
