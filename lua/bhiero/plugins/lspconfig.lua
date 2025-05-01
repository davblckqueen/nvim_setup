return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		servers = {
			jdtls = {},
		},
		setup = {
			jdtls = function()
				return true -- avoid duplicate servers
			end,
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				-- Set key mappings here...
				local buf_map = function(mode, lhs, rhs, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				-- LSP mappings
				local opts = { noremap = true, silent = true, buffer = bufnr }
				buf_map("n", "gd", vim.lsp.buf.definition, opts) -- Go to definition
				buf_map("n", "gD", vim.lsp.buf.declaration, opts) -- Go to declaration
				buf_map("n", "gr", vim.lsp.buf.references, opts) -- Show references
				buf_map("n", "gi", vim.lsp.buf.implementation, opts) -- Go to implementation
				buf_map("n", "K", vim.lsp.buf.hover, opts) -- Hover information
				buf_map("n", "<leader>vd", vim.diagnostic.open_float, opts)
				buf_map("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
				buf_map("n", "<C-h>", vim.lsp.buf.signature_help, opts) -- Signature help
				buf_map("n", "<leader>rn", vim.lsp.buf.rename, opts) -- Rename symbol
				buf_map("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Code actions
				buf_map("n", "[d", vim.diagnostic.goto_prev, opts) -- Previous diagnostic
				buf_map("n", "]d", vim.diagnostic.goto_next, opts) -- Next diagnostic
				buf_map("n", "<leader>q", vim.diagnostic.setloclist, opts) -- Set location list
				buf_map("n", "<leader>pr", function()
					require("telescope.builtin").lsp_references()
				end, opts)
			end,
		})

		local on_attach = function(client, bufnr)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
		end

		-- Configure clangd for C/C++
		lspconfig.clangd.setup({
			capabilities = capabilities,
			cmd = { "clangd", "--compile-commands-dir=build" },
			on_attach = on_attach,
		})

		-- Configure cmake language server
		lspconfig.cmake.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.jdtls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
