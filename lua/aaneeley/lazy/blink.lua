return { -- Autocompletion
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		"saghen/blink.compat",
		-- Supermaven
		{
			"supermaven-inc/supermaven-nvim",
			opts = {
				keymaps = {
					accept_suggestion = nil,
				},
				disable_inline_completion = false,
			},
		},
		-- Snippet Engine
		-- {
		-- 	"L3MON4D3/LuaSnip",
		-- 	version = "2.*",
		-- 	build = (function()
		-- 		-- Build Step is needed for regex support in snippets.
		-- 		-- This step is not supported in many windows environments.
		-- 		-- Remove the below condition to re-enable on windows.
		-- 		if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
		-- 			return
		-- 		end
		-- 		return "make install_jsregexp"
		-- 	end)(),
		-- 	dependencies = {
		-- 		-- `friendly-snippets` contains a variety of premade snippets.
		-- 		--    See the README about individual language/framework/plugin snippets:
		-- 		--    https://github.com/rafamadriz/friendly-snippets
		-- 		-- {
		-- 		--   'rafamadriz/friendly-snippets',
		-- 		--   config = function()
		-- 		--     require('luasnip.loaders.from_vscode').lazy_load()
		-- 		--   end,
		-- 		-- },
		-- 	},
		-- 	opts = {},
		-- },
		"folke/lazydev.nvim",
	},
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = {
			-- See :h blink-cmp-config-keymap for defining your own keymap
			preset = "super-tab",
		},

		appearance = {
			nerd_font_variant = "mono",
		},
		completion = {
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
				},
			},
			menu = {
				border = "rounded",
				winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
				draw = {
					gap = 2,
					padding = { 1, 1 },
					columns = {
						{ "custom_kind_icon", gap = 2 },
						{ "label", gap = 1 },
					},
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
						custom_kind_icon = {
							text = function(ctx)
								return (ctx.source_name == "supermaven" and "" or ctx.kind_icon) .. ctx.icon_gap
							end,
						},
					},
				},
			},
		},

		sources = {
			default = { "lsp", "path", "lazydev", "supermaven" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 4 },
				supermaven = {
					name = "supermaven",
					module = "blink.compat.source",
					min_keyword_length = 0,
					score_offset = 100,
				},
				lsp = {
					min_keyword_length = 0,
					score_offset = 2,
				},
				path = {
					min_keyword_length = 1,
					score_offset = 1,
				},
			},
		},

		-- snippets = { preset = "luasnip" },

		-- See :h blink-cmp-config-fuzzy for more information
		fuzzy = { implementation = "lua" },

		-- Shows a signature help window while you type arguments for a function
		signature = { enabled = true, window = {
			show_documentation = false,
		} },
	},
}
