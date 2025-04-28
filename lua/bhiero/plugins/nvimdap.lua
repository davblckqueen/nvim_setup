return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
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

		vim.keymap.set("n", "<leader>sb", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })
	end,
}
