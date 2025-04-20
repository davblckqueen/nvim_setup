vim.g.mapleader = " "

--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- because windows :/
vim.keymap.set("n", "<leader>bv", "<C-v>") 
--my split and tabs remaps
vim.keymap.set("n", "<leader>b%", function()
    vim.cmd(":split")
end)
vim.keymap.set("n", '<leader>b"', function()
    vim.cmd(":vsplit")
end)
