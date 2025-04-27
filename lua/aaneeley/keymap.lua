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

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, desc = "Jump to definition" })
vim.keymap.set(
	"n",
	"<C-w>gd",
	":vsplit | lua vim.lsp.buf.definition()<CR>",
	{ desc = "Jump to definition in new split" }
)
