return {
	"rktjmp/lush.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local lush = require("lush") -- this line was missing

		vim.opt.termguicolors = true
		vim.g.background = "dark"

		local theme = require("bhiero.theme.cybersigilism")
		lush(theme)

		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.cmd("highlight Normal guibg=NONE")
				vim.cmd("highlight NormalFloat guibg=#110000")
				vim.cmd("highlight EndOfBuffer guibg=NONE")
			end,
		})

		-- apply transparency immediately too
		vim.cmd("highlight Normal guibg=NONE")
		vim.cmd("highlight EndOfBuffer guibg=NONE")
	end,
}
