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

        local on_attach = function(client, bufnr)
            local buf_map = function(mode, lhs, rhs, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, lhs, rhs, opts)
            end

            -- LSP mappings
            buf_map('n', 'gd', vim.lsp.buf.definition)           -- Go to definition
            buf_map('n', 'gD', vim.lsp.buf.declaration)          -- Go to declaration
            buf_map('n', 'gr', vim.lsp.buf.references)           -- Show references
            buf_map('n', 'gi', vim.lsp.buf.implementation)       -- Go to implementation
            buf_map('n', 'K', vim.lsp.buf.hover)                 -- Hover information
            buf_map('n', '<leader>vd', vim.diagnostic.open_float)
            buf_map('n', '<leader>vws', vim.lsp.buf.workspace_symbol)
            buf_map('n', '<C-h>', vim.lsp.buf.signature_help)    -- Signature help
            buf_map('n', '<leader>rn', vim.lsp.buf.rename)       -- Rename symbol
            buf_map('n', '<leader>ca', vim.lsp.buf.code_action)  -- Code actions
            buf_map('n', '[d', vim.diagnostic.goto_prev)         -- Previous diagnostic
            buf_map('n', ']d', vim.diagnostic.goto_next)         -- Next diagnostic
            buf_map('n', '<leader>q', vim.diagnostic.setloclist) -- Set location list
        end
        
        -- Configure clangd for C/C++
        lspconfig.clangd.setup({
            capabilities = capabilities,
        })

        -- Configure cmake language server
        lspconfig.cmake.setup({
            capabilities = capabilities,
        })
    end
}
