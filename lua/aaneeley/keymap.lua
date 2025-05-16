-- See `:help vim.keymap.set()`

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Beginning and end of line rebinds
vim.keymap.set("n", "H", "^", { desc = "Move to first non empty character of line" })
vim.keymap.set("n", "L", "$", { desc = "Move to last non empty character of line" })

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- vim.keymap.set("n", "gt", "<cmd>BufferNext<CR>", { desc = "Go to [t]ab next" })
-- vim.keymap.set("n", "gT", "<cmd>BufferPrevious<CR>", { desc = "Go to [T]ab previous" })
-- vim.keymap.set("n", "<leader>p", "<cmd>BufferPick<CR>", { desc = "buffer [p]ick" })
-- vim.keymap.set("n", "<leader>P", "<cmd>BufferPickDelete<CR>", { desc = "buffer [P]ick delete" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })

-- Open terminal in new tab
vim.keymap.set("n", "<leader>t", "<cmd>tabnew | terminal<CR>", { desc = "Open terminal in new tab" })

-- Show blame
vim.keymap.set("n", "<leader>b", "<cmd>Gitsigns blame<CR>", { desc = "Show blame" })

-- Language server keymaps
vim.api.nvim_create_autocmd("FileType", {
	pattern = "rust",
	callback = function()
		vim.keymap.set("n", "<leader>rt", ":vsplit | terminal cargo nextest run<CR>", { buffer = true })
		vim.keymap.set("n", "<leader>rr", ":vsplit | terminal cargo run<CR>", { buffer = true })
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.keymap.set("n", "<leader>rt", ":vsplit | terminal grc go test -v ./...<CR>", { buffer = true })
		vim.keymap.set("n", "<leader>rr", ":vsplit | terminal go run .<CR>", { buffer = true })
	end,
})
