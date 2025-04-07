return {
    "williamboman/mason-lspconfig.nvim",
    after = { "mason.nvim", "nvim-lspconfig" },
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = {
                -- Language servers
                "jdtls",
                "rust_analyzer",
                "lemminx",
            },
            handlers = {
                function(server_name)
                    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
                    require('lspconfig')[server_name].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
            },
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })
    end
}
