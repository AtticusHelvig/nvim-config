-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line numbers
vim.o.relativenumber = true

-- Clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Case-insensitve searching unless intentional
vim.o.ignorecase = true
vim.o.smartcase = true

-- Show which line your cursor is on
vim.o.cursorline = true

-- Save warnings
vim.o.confirm = true

-- Tabs look like spaces
vim.o.tabstop = 4
