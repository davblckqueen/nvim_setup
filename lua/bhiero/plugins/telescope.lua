return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>po', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope find on git files' })
        vim.keymap.set('n', '<leader>pf', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end
}
