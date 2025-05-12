return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},
	config = function()
		require("Comment").setup({
			toggler = {
				line = ";;", -- Toggle line comment
				block = ";b", -- Toggle block comment
			},
			opleader = {
				line = ";", -- Operator-pending line comment
				block = ";b", -- Operator-pending block comment
			},
			extra = {
				above = ";O", -- Add comment on the line above
				below = ";o", -- Add comment on the line below
				eol = ";A", -- Add comment at end of line
			},
			mappings = {
				basic = true, -- Enable basic mappings
				extra = true, -- Enable extra mappings
			},
		})
		-- Remove 'gc' and 'gb' mappings in normal and visual modes
		vim.keymap.del("n", "gc")
		vim.keymap.del("n", "gcc")
	end,
}
