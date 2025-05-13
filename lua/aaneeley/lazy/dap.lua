return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"jay-babu/mason-nvim-dap.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local mason_dap = require("mason-nvim-dap")
		local dap = require("dap")
		local ui = require("dapui")
		local dap_virtual_text = require("nvim-dap-virtual-text")
		mason_dap.setup()

		dap_virtual_text.setup()

		mason_dap.setup({
			ensure_installed = {
				"delve",
			},
			automatic_installation = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		dap.configurations = {
			go = {
				{
					name = "Debug project",
					type = "delve",
					request = "launch",
					program = "${workspaceFolder}",
					dlvToolPath = "/usr/local/bin/dlv",
					-- dlvLoadConfig = {
					-- 	followPointers = true,
					-- 	maxVariableRecurse = 1,
					-- 	maxStringLen = 1000,
					-- 	maxArrayValues = 100,
					-- 	maxStructFields = -1,
					-- },
				},
			},
		}

		ui.setup()

		dap.listeners.before.attach.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			ui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
		end

		-- Keybinds
		vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { noremap = true })
		vim.keymap.set("n", "<leader>dr", "<cmd>DapNew<cr>", { noremap = true })
		vim.keymap.set("n", "<leader>dq", dap.terminate, { noremap = true })
	end,
}
