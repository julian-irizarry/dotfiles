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
  
  -- Themes
  {'notken12/base46-colors'},
  {'folke/tokyonight.nvim'},
  {'joshdick/onedark.vim'},
  {'tanvirtin/monokai.nvim'},
  {'lunarvim/darkplus.nvim'},
}

return Plugins
