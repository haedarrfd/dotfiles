return {
	"mfussenegger/nvim-dap",
	enabled = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"leoluz/nvim-dap-go",
	},
	keys = {
		{
			"<F1>",
			function()
				require("dap").continue()
			end,
			desc = "Start/continue debug",
		},
		{
			"<F3>",
			function()
				require("dap").step_over()
			end,
			desc = "Step over",
		},
		{
			"<F2>",
			function()
				require("dap").step_into()
			end,
			desc = "Step into",
		},
		{
			"<F4>",
			function()
				require("dap").step_out()
			end,
			desc = "Step out",
		},
		{
			"<F5>",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate debugging",
		},
		{
			"<leader>tb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle breakpoint",
		},
		{
			"<leader>sb",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Set breakpoint",
		},
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "See last session result",
		},
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		require("mason-nvim-dap").setup({
			ensure_installed = { "delve" },
			automatic_installation = false,
			handler = {},
		})

		require("dap-go").setup()
	end,
}
