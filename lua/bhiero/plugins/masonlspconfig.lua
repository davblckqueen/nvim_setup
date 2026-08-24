return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		require("mason-lspconfig").setup({
			-- stylua is a formatter managed by null-ls, not an LSP server
			automatic_enable = {
				exclude = { "stylua" },
			},
		})
	end,
}
