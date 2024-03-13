-- Space as leader key
vim.g.mapleader = ' '

-- middle screen movement
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Shortcuts
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h', '^') -- beginning of line
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', 'g_') -- end of line
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

-- easier buffer navigation
vim.keymap.set('n', '<leader>p', ':bprev<CR>')
vim.keymap.set('n', '<leader>n', ':bnext<CR>')

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- move visually selected text up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- newline w/o leaving normal mode
vim.keymap.set("n", "<leader>o", "o<ESC>0\"_D", { desc = "newline w/o leaving normal" })
vim.keymap.set("n", "<leader>O", "O<ESC>0\"_D", { desc = "newline w/o leaving normal" })
