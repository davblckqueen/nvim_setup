return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = {
					normal = {
						a = { fg = "#0a0000", bg = "#ff0000", gui = "bold" },
						b = { fg = "#ff6666", bg = "#1a0000" },
						c = { fg = "#993333", bg = "#0a0000" },
					},
					insert = {
						a = { fg = "#0a0000", bg = "#cc0033", gui = "bold" },
						b = { fg = "#ff6666", bg = "#1a0000" },
						c = { fg = "#993333", bg = "#0a0000" },
					},
					visual = {
						a = { fg = "#0a0000", bg = "#ff3300", gui = "bold" },
						b = { fg = "#ff6666", bg = "#1a0000" },
						c = { fg = "#993333", bg = "#0a0000" },
					},
					replace = {
						a = { fg = "#0a0000", bg = "#990000", gui = "bold" },
						b = { fg = "#ff6666", bg = "#1a0000" },
						c = { fg = "#993333", bg = "#0a0000" },
					},
					command = {
						a = { fg = "#0a0000", bg = "#ff0066", gui = "bold" },
						b = { fg = "#ff6666", bg = "#1a0000" },
						c = { fg = "#993333", bg = "#0a0000" },
					},
					inactive = {
						a = { fg = "#550000", bg = "#0a0000", gui = "bold" },
						b = { fg = "#550000", bg = "#0a0000" },
						c = { fg = "#330000", bg = "#0a0000" },
					},
				},
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = true, -- single statusline across all splits
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return " " .. str
						end,
					},
				},
				lualine_b = {
					{ "branch", icon = "" },
					{
						"diff",
						symbols = { added = " ", modified = " ", removed = " " },
						diff_color = {
							added = { fg = "#ff0000" },
							modified = { fg = "#ff3300" },
							removed = { fg = "#660000" },
						},
					},
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = "󰌵 " },
						diagnostics_color = {
							error = { fg = "#ff0000" },
							warn = { fg = "#ff3300" },
							info = { fg = "#cc3333" },
							hint = { fg = "#993333" },
						},
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1, -- show relative path
						symbols = {
							modified = "  ",
							readonly = "  ",
							unnamed = " 󰡯 no name",
						},
					},
				},
				lualine_x = {
					"encoding",
					"fileformat",
					{
						"filetype",
						colored = true,
						icon_only = false,
					},
				},
				lualine_y = { "progress" },
				lualine_z = {
					{
						"location",
						fmt = function(str)
							return " " .. str
						end,
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "fugitive", "lazy", "neo-tree" },
		})
	end,
}
