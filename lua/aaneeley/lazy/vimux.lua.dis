return {
	"preservim/vimux",
	config = function()
		vim.keymap.set(
			"n",
			"<leader>vp",
			":VimuxPromptCommand<CR>",
			{ noremap = true, desc = "[p]rompt for command to run in new tmux pane" }
		)
		vim.keymap.set(
			"n",
			"<leader>va",
			":VimuxRunLastCommand<CR>",
			{ noremap = true, desc = "Re-run last command [a]gain" }
		)
		vim.keymap.set(
			"n",
			"<leader>vc",
			":VimuxClearTerminalScreen<CR>",
			{ noremap = true, desc = "[c]lear terminal screen" }
		)
		vim.keymap.set(
			"n",
			"<leader>ve",
			":VimuxCloseRunner<CR>",
			{ noremap = true, desc = "[e]xit the open Vimux runner" }
		)
		vim.keymap.set(
			"n",
			"<leader>vi",
			":VimuxInterruptRunner<CR>",
			{ noremap = true, desc = "[i]nterrupt the open Vimux runner" }
		)
	end,
}
