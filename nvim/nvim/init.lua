local load = function(mod)
	package.loaded[mod] = nil
	require(mod)
end

load('user.settings')
load('user.commands')
load('user.keymaps')
load('user.plugins')

-- Customize colorscheme
pcall(vim.cmd.colorscheme, 'vscode')

function trans()
	vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = 'black' }) -- overrides `~` character at the end of buffer
	-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
	-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end

trans()
