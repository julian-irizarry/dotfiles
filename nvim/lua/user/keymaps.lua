-- Space as leader key
vim.g.mapleader = ' '

-- Shortcuts
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^')
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_')
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>')

-- Basic clipboard interaction
vim.keymap.set({ 'n', 'x' }, 'gy', '"+y') -- copy
vim.keymap.set({ 'n', 'x' }, 'gp', '"+p') -- paste

-- Delete text
vim.keymap.set({ 'n', 'x' }, 'x', '"_x')

-- Commands
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>')
vim.keymap.set('n', '<leader>bq', '<cmd>bdelete<cr>')
vim.keymap.set('n', '<leader>bl', '<cmd>buffer #<cr>')


-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- move visually selected text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- end of line
vim.keymap.set({ "n", "v" }, "-", "<End>", { desc = "end of line" })

-- newline w/o leaving normal mode
vim.keymap.set("n", "<leader>o", "o<ESC>0\"_D", { desc = "newline w/o leaving normal" })
vim.keymap.set("n", "<leader>O", "O<ESC>0\"_D", { desc = "newline w/o leaving normal" })
