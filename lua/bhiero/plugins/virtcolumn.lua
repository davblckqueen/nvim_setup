return { 
    "lukas-reineke/virt-column.nvim", 
    opts = {}, 
    config = function() 
        require("virt-column").setup {
            char = "│" 
        }
    end,
}

