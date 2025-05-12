return {
	"stevearc/overseer.nvim",
	opts = {
		strategy = "toggleterm",
		templates = { "builtin" },
		--		template_dirs = { "bhiero.overseer.templates" },
		auto_detect_success_color = true,
	},
	config = function()
		require("overseer").setup()
		vim.api.nvim_set_hl(0, "OverseerPENDING", { fg = "#AF5F00", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerRUNNING", { fg = "#D78700", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerSUCCESS", { fg = "#5F875F", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerFAILURE", { fg = "#AF0000", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerCANCELLED", { fg = "#5F5F5F", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerTask", { fg = "#AF5F00", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerComponent", { fg = "#AF5F00", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerField", { fg = "#AF5F00", bg = "NONE" })
		vim.api.nvim_set_hl(0, "OverseerTaskBorder", { fg = "#AF5F00", bg = "NONE" })
	end,
}
