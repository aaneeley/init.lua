-- See `:help vim.keymap.set()`

--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set(
	"n",
	"gh",
	vim.lsp.buf.hover,
	{ noremap = true, desc = "Show [h]over documentation for symbol (same as [K])" }
)

-- Beginning and end of line rebinds
vim.keymap.set("n", "H", "^", { desc = "Move to first non empty character of line" })
vim.keymap.set("n", "L", "$", { desc = "Move to last non empty character of line" })

-- Clear highlights on search when pressing <Esc> in normal mode
-- See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

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
