-- See `:help vim.o` or `:help option-list`

vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

--  See `:help 'clipboard'`
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.undofile = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.cursorline = true

vim.o.scrolloff = 10

vim.o.colorcolumn = "80"

-- WARN: Breaks telescope
-- vim.o.winborder = "rounded"

vim.o.winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search"
-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
