vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.signcolumn = 'no'
vim.o.statuscolumn = '%C%l%=%s'
vim.opt.termguicolors = true
vim.opt.cmdheight = 0

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.timeoutlen = 600
