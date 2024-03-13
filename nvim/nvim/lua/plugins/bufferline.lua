local Plugin = {'akinsho/bufferline.nvim'}
Plugin.enabled = false

Plugin.name = 'bufferline'

Plugin.event = 'VeryLazy'

Plugin.opts = {
  options = {
    mode = 'buffers',
    offsets = {
      {filetype = 'NvimTree'}
    },
  },
  -- :help bufferline-highlights
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  },

}

function Plugin.init()
  vim.keymap.set('n', '<tab>', '<cmd>BufferLineCycleNext<CR>')
  vim.keymap.set('n', '<S-tab>', '<cmd>BufferLineCyclePrev<CR>')
end

return Plugin
