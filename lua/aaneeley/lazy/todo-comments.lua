-- TODO: Highlight todo, notes, etc in comments
-- This is a multiline todo
-- TODO: asdf
-- HACK: what does this mean?
-- PERF: Performance
-- NOTE: Notes
-- FIX: Some issues
-- WARNING: Let em know
return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = true, keywords = { TODO = { color = "warning" } } },

	config = function(_, opts)
		vim.keymap.set(
			"n",
			"<leader>n",
			":TodoQuickFix<CR>",
			{ noremap = true, silent = true, desc = "Show todos and [n]otes" }
		)
		require("todo-comments").setup(opts)
	end,
}
