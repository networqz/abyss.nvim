-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- variable
vim.g.have_nerd_font = true -- change to false if not using nerd font

-- editor
vim.o.confirm = true -- raise a dialog on operations that would fail due to unsaved changes
vim.o.scrolloff = 8 -- minimal number of screen lines above and belove sursor
vim.o.signcolumn = "yes" --- set signcolumn to be always visible

vim.o.updatetime = 128 -- time to wait for swap file update in ms
vim.o.timeoutlen = 256 -- time to wait for mapped sequence in ms

vim.o.splitright = true -- vertical split window to the right
vim.o.splitbelow = true -- horizontal split window to the bottom

-- cursor
vim.o.guicursor = "" -- set cursor to block in all modes
vim.o.cursorline = true -- highlight line where is cursor

-- numbers
vim.o.nu = true -- enable line numbers
vim.o.relativenumber = true -- enable relative numbers for easier jumping

-- tab
vim.o.tabstop = 4 -- spaces
vim.o.softtabstop = 4 -- spaces
vim.o.shiftwidth = 4 -- spaces
vim.o.expandtab = true -- use spaces instead of tabs

-- search
vim.o.hlsearch = false
vim.o.incsearch = true
