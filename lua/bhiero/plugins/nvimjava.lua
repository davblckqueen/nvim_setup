return {
    "nvim-java/nvim-java",
    dependencies = {
        "nvim-java/lua-async-await",
        "nvim-java/nvim-java-core",
        "nvim-java/nvim-java-test",
        "nvim-java/nvim-java-dap",
    },
    config = function()
        require("java").setup()
    end,
}
