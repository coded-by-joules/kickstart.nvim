vim.opt.history = 500

vim.opt.wildmenu = true
if vim.fn.has 'win16' == 1 or vim.fn.has 'win32' then vim.opt.wildignore:append '.git\\*,.hg\\*,.svn\\*' end

vim.opt.ruler = true
vim.opt.cmdheight = 1

vim.opt.hid = true
vim.opt.wrap = false
vim.opt.textwidth = 0

vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.showmatch = true

vim.opt.mat = 2

vim.opt.backup = false
vim.opt.wb = false
vim.opt.swapfile = false

vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.lbr = true
vim.opt.tw = 500

vim.opt.ai = true
vim.opt.si = true

vim.opt.encoding = 'utf8'
vim.opt.ffs = 'unix,dos,mac'
