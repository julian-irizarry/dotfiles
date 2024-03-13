local Plugin = {'moll/vim-bbye'}

Plugin.cmd = 'Bdelete'

function Plugin.init()
  vim.keymap.set('n', '<C-x>', '<cmd>Bdelete<CR>')
end

return Plugin
