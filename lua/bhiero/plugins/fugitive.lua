return {
	{
		'tpope/vim-fugitive',
		event = 'BufWinEnter',
		keys = {
			{
				"<C-k>",
				":Git<CR><C-w>j",
				desc = "Open git by fugitive",
				silent = true,
			}
		}
	},
}
