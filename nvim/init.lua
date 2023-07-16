local load = function(mod)
  package.loaded[mod] = nil
  require(mod)
end

load('user.settings')
load('user.commands')
load('user.keymaps')
load('user.plugins')

pcall(vim.cmd.colorscheme, 'onedark')

function trans()
	vim.api.nvim_set_hl(0, "Normal", {bg = 'none'})
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = 'none'})
end

-- trans()
