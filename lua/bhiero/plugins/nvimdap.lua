return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		local mason_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
		local codelldb_path = mason_path .. "adapter/codelldb"

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = codelldb_path,
				args = { "--port", "${port}" },
			},
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = false,
			},
		}
		dap.configurations.c = dap.configurations.cpp

		-- Customization
		vim.fn.sign_define("DapBreakpoint", {
			text = "●",
			texthl = "DapBreakpoint",
			linehl = "",
			numhl = "",
		})
		vim.cmd([[highlight DapBreakpoint guifg=#FF0000]])
		vim.fn.sign_define("DapBreakpointCondition", {
			text = "◆",
			texthl = "DapBreakpointCondition",
			linehl = "",
			numhl = "",
		})
		vim.fn.sign_define("DapLogPoint", {
			text = "◉",
			texthl = "DapLogPoint",
			linehl = "",
			numhl = "",
		})
		vim.fn.sign_define("DapStopped", {
			text = "▶",
			texthl = "DapStopped",
			linehl = "DapStoppedLine",
			numhl = "",
		})

		vim.keymap.set("n", "gb", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })

		vim.keymap.set("n", "gB", function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end, { desc = "Set Conditional Breakpoint" })

		vim.keymap.set("n", "gl", function()
			dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
		end, { desc = "Set Log Point" })
	end,
}
