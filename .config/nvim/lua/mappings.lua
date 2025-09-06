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
map("n", "<leader>?", "<cmd>Telescope oldfiles<CR>", { desc = "Telescope Find Recent Files" })
map("n", "<leader><space>", "<cmd>Telescope buffers<CR>", { desc = "Telescope List Buffers" })
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Telescope Find Files" })
map("n", "<leader>fn", function()
  builtin.find_files {
    cwd = vim.fn.stdpath "config",
  }
end, { desc = "Telescope Find Neovim Config" })
map("n", "<leader>fp", function()
  builtin.find_files {
    cwd = vim.fn.stdpath "data" .. "/lazy",
  }
end, { desc = "Telescope Find Plugin Source" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Search with Live Grep" })
map("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Telescope Show Diagnostics" })
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Search in Current Buffer" })
map(
  "n",
  "<leader>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
  { desc = "Telescope Open File Browser" }
)
map("n", "<leader>fS", ":Telescope lsp_document_symbols<CR>", { desc = "Telescope Show LSP Document Symbols" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope [S]earch [H]elp Tags" })
map("n", "<leader>sk", builtin.keymaps, { desc = "Telescope [S]earch [K]eymaps" })
map(
  "v",
  "<leader>fw",
  ':Telescope live_grep default_text=<C-r>"<CR>',
  { noremap = true, silent = true, desc = "Telescope Search Selected Text with Live Grep" }
)

-- Definitions and references
map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Lspsaga Go to [D]efinition" })
-- map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Lspsaga [P]eek Definition" })

-- Hover and documentation
map("n", "shift+k", "<cmd>Lspsaga hover_doc<CR>", { desc = "Lspsaga [H]over Documentation" })

-- Diagnostics
map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Lspsaga Show Line [D]iagnostics" })
map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Lspsaga Jump to Previous [D]iagnostic" })
map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Lspsaga Jump to Next [D]iagnostic" })

-- Code actions
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Lspsaga Trigger [C]ode [A]ction" })
map(
  "v",
  "<leader>ca",
  "<cmd>Lspsaga code_action<CR>",
  { noremap = true, silent = true, desc = "Lspsaga Trigger [C]ode [A]ction (Visual)" }
)

map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Telescope Search [G]it [S]tatus"})

-- Rename
map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Lspsaga [R]e[n]ame Symbol" })

-- Symbol outline
map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Lspsaga Toggle Symbol [O]utline" })

-- Finder
map("n", "<leader>gr", "<cmd>Lspsaga finder<CR>", { desc = "Lspsaga [F]ind References and Definitions" })

-- Call hierarchy
map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Lspsaga [C]all Hierarchy: [I]ncoming" })
map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Lspsaga [C]all Hierarchy: [O]utgoing" })

-- Key mappings for navigating diagnostics and showing floats
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Goto Prev [d]iagnostic" })
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Goto Prev [d]iagnostic" })

-- Folding keybindings
map("n", "<leader>cf", "zc", { desc = "Fold current function/class" })
map("n", "<leader>uf", "zo", { desc = "Unfold current function/class" })
map("n", "<leader>fa", "zR", { desc = "Unfold all" })
map("n", "<leader>fz", "zM", { desc = "Fold all" })

-- buffer commands
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>x", ":bdelete<CR>", { desc = "Close current buffer" })
map("n", "<leader><tab>", ":bnext<CR>", { desc = "Cycle through open buffers" })

-- run current line(s)
map("n", "<leader>c", ":.lua<CR>", { desc = "Execute selected line" })
map("v", "<leader>c", ":lua<CR>", { desc = "Execute selected lines" })

map('n', '<C-q>', ':q<CR>', {desc = "Close neovim"} )

local nomap = vim.keymap.del
nomap("i", "<C-b>")
nomap("i", "<C-e>")
nomap("n", "<C-n>")
nomap("n", "<Tab>")
nomap("n", "<leader>v")
