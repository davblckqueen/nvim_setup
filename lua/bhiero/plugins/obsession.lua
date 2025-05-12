return {
    'tpope/vim-obsession',
    -- Optional: Specify event to load the plugin on, e.g., when opening a file
    event = 'BufReadPost',
    config = function()
        vim.keymap.set("n", "<leader>b<C-s>", function()
            vim.cmd(":Obsession")
        end)
    end
  }
