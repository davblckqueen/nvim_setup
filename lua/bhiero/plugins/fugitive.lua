return {
	{
		'tpope/vim-fugitive',
		event = 'BufWinEnter',
		keys = {
			{
				"<C-k>",
				":Git<CR>",
				desc = "Open git by fugitive",
				silent = true,
			}
		}
	},
}
