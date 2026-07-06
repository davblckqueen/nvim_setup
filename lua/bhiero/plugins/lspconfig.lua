return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Apply capabilities to all servers (new vim.lsp.config API, replaces lspconfig framework)
		vim.lsp.config("*", { capabilities = capabilities })

		-- clangd needs a custom cmd; neocmake uses defaults from lspconfig's lsp/ dir
		vim.lsp.config("clangd", {
			cmd = { "clangd", "--compile-commands-dir=build" },
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local map = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
				end

				map("n", "gd", vim.lsp.buf.definition)
				map("n", "gD", vim.lsp.buf.declaration)
				map("n", "gr", vim.lsp.buf.references)
				map("n", "gi", vim.lsp.buf.implementation)
				map("n", "K", vim.lsp.buf.hover)
				map("n", "<leader>vd", vim.diagnostic.open_float)
				map("n", "<leader>vws", vim.lsp.buf.workspace_symbol)
				map("n", "<C-h>", vim.lsp.buf.signature_help)
				map("n", "<leader>rn", vim.lsp.buf.rename)
				map("n", "<leader>ca", vim.lsp.buf.code_action)
				map("n", "[d", vim.diagnostic.goto_prev)
				map("n", "]d", vim.diagnostic.goto_next)
				map("n", "<leader>q", vim.diagnostic.setloclist)
				map("n", "<leader>pr", function()
					require("telescope.builtin").lsp_references()
				end)
			end,
		})
	end,
}
