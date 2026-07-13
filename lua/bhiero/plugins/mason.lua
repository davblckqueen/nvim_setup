return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup({
            ensure_installed = {
                "java-test",
                "java-debug-adapter",
                "rust-analyzer",
                "lemminx",
                "clangd",
                "neocmakelsp",
                "python-lsp-server",
            },
        })
    end
}
