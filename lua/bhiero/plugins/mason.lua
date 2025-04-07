return {
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup {
            ensure_installed = {
                "java-test",
                "java-debug-adapter",
            }
        }
    end
}
