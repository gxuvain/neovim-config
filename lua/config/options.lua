vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.hlsearch = false
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.wrap = false
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"
vim.o.winborder = "rounded"

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end
})
