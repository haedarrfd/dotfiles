return {
	"mfussenegger/nvim-dap",
	enabled = true,
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
	},
	keys = {
		{
			"<F1>",
			function()
				require("dap").continue()
			end,
			desc = "Start/Continue Debug",
		},
		{
			"<F3>",
			function()
				require("dap").step_over()
			end,
			desc = "Step Over",
		},
		{
			"<F2>",
			function()
				require("dap").step_into()
			end,
			desc = "Step Into",
		},
		{
			"<F4>",
			function()
				require("dap").step_out()
			end,
			desc = "Step Out",
		},
		{
			"<F5>",
			function()
				require("dap").terminate()
			end,
			desc = "Terminate Debug",
		},
		{
			"<leader>tb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<leader>sb",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Set Breakpoint",
		},
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "See Last Result",
		},
		{
			"<leader>dp",
			function()
				require("dap-python").test_method()
			end,
			desc = "See Last Result",
		},
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		local py_path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"

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
			ensure_installed = { "delve", "python" },
			automatic_installation = false,
			handler = {},
		})

		require("dap-go").setup()

		require("dap-python").setup(py_path)
	end,
}
