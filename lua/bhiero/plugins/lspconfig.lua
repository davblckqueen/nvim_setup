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
