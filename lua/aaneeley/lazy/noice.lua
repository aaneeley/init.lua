return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			-- add any options here
			presets = {
				lsp_doc_border = true,
			},
			views = {
				hover = {
					border = { style = "rounded" },
				},
			},
		})
		vim.keymap.set(
			"n",
			"gh",
			require("noice.lsp").hover,
			{ noremap = true, desc = "Show [h]over documentation for symbol (same as [K])" }
		)
		vim.keymap.set({ "n", "i", "s" }, "<c-u>", function()
			if not require("noice.lsp").scroll(-4) then
				return "<c-u>"
			end
		end, { silent = true, expr = true })

		vim.keymap.set({ "n", "i", "s" }, "<c-d>", function()
			if not require("noice.lsp").scroll(4) then
				return "<c-d>"
			end
		end, { silent = true, expr = true })
		vim.keymap.set("n", "gH", vim.diagnostic.open_float, { noremap = true, desc = "Show [h]over diagnostics" })
	end,
}
