return {
	"mfussenegger/nvim-dap",
	config = function()
		vim.keymap.set("n", "<leader>sb", function()
			vim.cmd("DapToogleBreakpoint <CR>")
		end)
	end,
}
