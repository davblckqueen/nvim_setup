return {
    "williamboman/mason-lspconfig.nvim",
    after = { "mason.nvim", "nvim-lspconfig" },
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
            },
        })
    end
}
