return {
    'akinsho/bufferline.nvim', 
    version = "*", 
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        require("bufferline").setup({
            options = {
                offsets = {
                    {
                        filetype = "neo-tree",
                        raw = " %{%v:lua.__get_selector()%} ",
                        highlight = { sep = { link = "WinSeparator" } },
                        separator = "┃",
                    },
                },
            }
        })
    end
}
