return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",

			-- `build` is used to run some command when the plugin is installed/updated.
			-- This is only run then, not every time Neovim starts up.
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		-- [[ Configure Telescope ]]
		-- See `:help telescope` and `:help telescope.setup()`
		require("telescope").setup({
			defaults = {
				border = false,
				theme = "center",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
					},
				},
			},
			extensions = {
				file_browser = {
					display_stat = false,
					git_status = false,
					grouped = true,
					initial_mode = "normal",
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "file_browser")

		local builtin = require("telescope.builtin")

		--  NOTE: Searches
		--
		-- vim.keymap.set("n", "<leader>s/", function()
		-- 	builtin.live_grep({
		-- 		grep_open_files = true,
		-- 		prompt_title = "Live Grep in Open Files",
		-- 	})
		-- end, { desc = "[S]earch [/] in Open Files" })
		-- vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
		-- vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		-- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_ivy({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- Open file browser in neovim directory
		vim.keymap.set("n", "<leader>en", function()
			require("telescope").extensions.file_browser.file_browser({
				path = vim.fn.stdpath("config"),
			})
		end, { desc = "[E]xplore [N]eovim files" })
		-- Search neovim directory
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		-- Open file browser in project directory
		vim.keymap.set("n", "<leader>ep", function()
			require("telescope").extensions.file_browser.file_browser({ path = "~/Projects" })
		end, { desc = "[E]xplore [P]rojects directory" })

		-- Open file browser at current directory
		vim.keymap.set("n", "<leader>ef", function()
			require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" })
		end, { desc = "[E]xplore [F]iles in current directory" })
		-- Search files in cwd
		vim.keymap.set("n", "<leader>sf", function()
			builtin.find_files()
		end, { desc = "[S]earch [F]iles in current directory" })

		-- Search current repository
		vim.keymap.set("n", "<leader>sr", function()
			builtin.git_files()
		end, { desc = "[S]earch [R]epository files" })

		--  NOTE: Jumps
		--
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[D]efinition of word under cursor" })
		vim.keymap.set(
			"n",
			"<C-w>gd",
			"<cmd>vsplit | Telescope lsp_definitions<CR>",
			{ desc = "[D]efinition of word under cursor in new vsplit" }
		)
		vim.keymap.set("n", "gD", builtin.lsp_type_definitions, { desc = "type [D]efinition of word under cursor" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "[R]eferences of word under cursor" })

		-- Open telescope file search relative to current file
	end,
}
