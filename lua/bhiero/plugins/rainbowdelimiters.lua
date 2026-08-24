return {
	"HiPhish/rainbow-delimiters.nvim",
	config = function()
		local rainbow = require("rainbow-delimiters")

		vim.g.rainbow_delimiters = {
			strategy = {
				[""] = rainbow.strategy["global"],
				vim = rainbow.strategy["local"],
			},
			query = {
				[""] = "rainbow-delimiters",
				lua = "rainbow-blocks",
			},
			priority = {
				[""] = 110,
				lua = 210,
			},
			-- nesting levels: outermost → innermost
			-- stays in red/amber/coral family, never goes blue/green
			highlight = {
				"RainbowDelimiterRed", -- level 1: neon red
				"RainbowDelimiterOrange", -- level 2: orange-red
				"RainbowDelimiterAmber", -- level 3: amber
				"RainbowDelimiterCoral", -- level 4: coral
				"RainbowDelimiterDimRed", -- level 5: dim red
				"RainbowDelimiterRust", -- level 6: rust
				"RainbowDelimiterMagenta", -- level 7: magenta accent
			},
		}

		-- define the custom highlight groups
		vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#ff2200" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ff4400" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterAmber", { fg = "#cc7700" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterCoral", { fg = "#ff6644" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterDimRed", { fg = "#993322" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterRust", { fg = "#883311" })
		vim.api.nvim_set_hl(0, "RainbowDelimiterMagenta", { fg = "#cc3366" })

		-- reapply after colorscheme changes (lush resets highlights)
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				vim.api.nvim_set_hl(0, "RainbowDelimiterRed", { fg = "#ff2200" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ff4400" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterAmber", { fg = "#cc7700" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterCoral", { fg = "#ff6644" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterDimRed", { fg = "#993322" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterRust", { fg = "#883311" })
				vim.api.nvim_set_hl(0, "RainbowDelimiterMagenta", { fg = "#cc3366" })
			end,
		})
	end,
}
