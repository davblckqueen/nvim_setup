return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function () 
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { 
				"c", 
				"cpp", 
				"cmake",
				"rust",
				"doxygen",
				"go",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"typescript",
				"html",
				"css",
				"yaml",
				"tmux",
				"sql",
				"java",
				"json",
				"dockerfile",
				"make",
                "zig"
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },  
		})
	end
}
