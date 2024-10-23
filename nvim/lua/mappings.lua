require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Basic clipboard interaction
map({ "n", "x" }, "gy", '"+y') -- copy
map({ "n", "x" }, "gp", '"+p') -- paste

-- move visually selected text up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- newline w/o leaving normal mode
map("n", "<leader>o", 'o<ESC>0"_D', { desc = "newline w/o leaving normal" })
map("n", "<leader>O", 'O<ESC>0"_D', { desc = "newline w/o leaving normal" })

-- Shortcuts
map({ "n", "x", "o" }, "<leader>h", "^") -- beginning of line
map({ "n", "x", "o" }, "<leader>l", "g_") -- end of line
map("n", "<leader>a", ":keepjumps normal! ggVG<cr>")

map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "undo tree toggle" })

map("n", "<C-t>", function()
  require("nvchad.themes").open()
end)

local builtin = require "telescope.builtin"
map("n", "<leader>?", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader><space>", "<cmd>Telescope buffers<CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>")
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
map("n", "<leader>fS", ":Telescope lsp_document_symbols<CR>")
map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("v", "<leader>fw", ':Telescope live_grep default_text=<C-r>"<CR>', { noremap = true, silent = true })

require("telescope").load_extension "fzf"
require("telescope").load_extension "file_browser"

-- Key mappings for navigating diagnostics and showing floats
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Goto Prev [d]iagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Goto Prev [d]iagnostic" })

local nomap = vim.keymap.del

nomap("i", "<C-b>")
nomap("i", "<C-e>")
nomap("n", "<C-n>")
nomap("n", "<leader>v")
-- nomap("n", "fw")
