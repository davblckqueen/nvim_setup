return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		close_if_last_window = true,

		-- ── POPUP BORDER STYLE ────────────────────────────────────────────
		popup_border_style = "rounded",

		-- ── WINDOW ────────────────────────────────────────────────────────
		window = {
			position = "left",
			width = 35,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
		},

		-- ── DEFAULT COMPONENT CONFIGS ─────────────────────────────────────
		default_component_configs = {
			container = {
				enable_character_fade = true,
			},
			indent = {
				indent_size = 2,
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			icon = {
				folder_closed = "",
				folder_open = "",
				folder_empty = "󰜌",
				folder_empty_open = "󰜌",
				default = "",
				highlight = "NeoTreeFileIcon",
			},
			modified = {
				symbol = "󰝉 ",
				highlight = "NeoTreeModified",
			},
			name = {
				trailing_slash = false,
				use_git_status_colors = true,
				highlight = "NeoTreeFileName",
			},
			git_status = {
				symbols = {
					added = "",
					modified = "",
					deleted = "󰧧",
					renamed = "󰁕",
					untracked = "󰓻",
					ignored = "󰈉",
					unstaged = "󰄱",
					staged = "󰱒",
					conflict = "",
				},
			},
			diagnostics = {
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = "󰌵 ",
				},
				highlights = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
				},
			},
		},

		-- ── FILESYSTEM ────────────────────────────────────────────────────
		filesystem = {
			hijack_netrw_behavior = "open_current",
			filtered_items = {
				visible = false,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			components = {
				harpoon_index = function(config, node, _)
					local harpoon_list = require("harpoon"):list()
					local path = node:get_id()
					local harpoon_key = vim.uv.cwd()

					for i, item in ipairs(harpoon_list.items) do
						local value = item.value
						if string.sub(item.value, 1, 1) ~= "/" then
							value = harpoon_key .. "/" .. item.value
						end
						if value == path then
							return {
								text = string.format(" ⥤ %d", i),
								highlight = config.highlight or "NeoTreeDirectoryIcon",
							}
						end
					end
					return {}
				end,
			},
			renderers = {
				file = {
					{ "icon" },
					{ "name", use_git_status_colors = true },
					{ "harpoon_index" },
					{ "diagnostics" },
					{ "git_status", highlight = "NeoTreeDimText" },
				},
			},
		},

		-- ── EVENT HANDLERS ────────────────────────────────────────────────
		event_handlers = {
			{
				event = "after_render",
				handler = function(state)
					if state.current_position == "left" or state.current_position == "right" then
						vim.api.nvim_win_call(state.winid, function()
							local str = require("neo-tree.ui.selector").get()
							if str then
								_G.__cached_neo_tree_selector = str
							end
						end)
					end
				end,
			},
			{
				event = "neo_tree_buffer_enter",
				handler = function()
					vim.cmd("highlight! Cursor blend=100")
					vim.cmd([[
						highlight! NeoTreeNormal               guibg=#0a0000 guifg=#ff6666
						highlight! NeoTreeNormalNC             guibg=#0a0000 guifg=#550000
						highlight! NeoTreeWinSeparator         guibg=#0a0000 guifg=#cc4400
						highlight! NeoTreeEndOfBuffer          guibg=#0a0000 guifg=#0a0000
						highlight! NeoTreeRootName             guifg=#cc4400 gui=bold
						highlight! NeoTreeDirectoryName        guifg=#cc4400
						highlight! NeoTreeDirectoryIcon        guifg=#cc4400
						highlight! NeoTreeFileIcon             guifg=#993300
						highlight! NeoTreeFileName             guifg=#ff6666
						highlight! NeoTreeFileNameOpened       guifg=#ff4400 gui=bold
						highlight! NeoTreeSymbolicLinkTarget   guifg=#882200 gui=italic
						highlight! NeoTreeIndentMarker         guifg=#330800
						highlight! NeoTreeExpander             guifg=#cc4400
						highlight! NeoTreeCursorLine           guibg=#1a0500
						highlight! NeoTreeDimText              guifg=#441100
						highlight! NeoTreeModified             guifg=#ff4400
						highlight! NeoTreeGitAdded             guifg=#cc4400
						highlight! NeoTreeGitModified          guifg=#ff4400
						highlight! NeoTreeGitDeleted           guifg=#660000
						highlight! NeoTreeGitRenamed           guifg=#ff6600
						highlight! NeoTreeGitUntracked         guifg=#882200
						highlight! NeoTreeGitIgnored           guifg=#331100
						highlight! NeoTreeGitUnstaged          guifg=#993300
						highlight! NeoTreeGitStaged            guifg=#cc4400
						highlight! NeoTreeGitConflict          guifg=#ff0066 gui=bold
						highlight! NeoTreeFilterTerm           guifg=#ff4400 gui=bold
						highlight! NeoTreeTabActive            guibg=#cc4400 guifg=#0a0000 gui=bold
						highlight! NeoTreeTabInactive          guibg=#1a0000 guifg=#550000
						highlight! NeoTreeTabSeparatorActive   guifg=#cc4400 guibg=#cc4400
						highlight! NeoTreeTabSeparatorInactive guifg=#0a0000 guibg=#0a0000
					]])
				end,
			},
			{
				event = "neo_tree_buffer_leave",
				handler = function()
					vim.cmd("highlight! Cursor guibg=#ff0000 blend=0")
				end,
			},
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	keys = {
		{ "<leader>pv", "<Cmd>Neotree toggle reveal=true<CR>", desc = "Toggle Neo-tree" },
	},
	config = function(_, opts)
		local function apply_highlights()
			vim.cmd([[
				highlight! NeoTreeNormal               guibg=#0a0000 guifg=#ff6666
				highlight! NeoTreeNormalNC             guibg=#0a0000 guifg=#550000
				highlight! NeoTreeWinSeparator         guibg=#0a0000 guifg=#cc4400
				highlight! NeoTreeEndOfBuffer          guibg=#0a0000 guifg=#0a0000
				highlight! NeoTreeRootName             guifg=#cc4400 gui=bold
				highlight! NeoTreeDirectoryName        guifg=#cc4400
				highlight! NeoTreeDirectoryIcon        guifg=#cc4400
				highlight! NeoTreeFileIcon             guifg=#993300
				highlight! NeoTreeFileName             guifg=#ff6666
				highlight! NeoTreeFileNameOpened       guifg=#ff4400 gui=bold
				highlight! NeoTreeSymbolicLinkTarget   guifg=#882200 gui=italic
				highlight! NeoTreeIndentMarker         guifg=#330800
				highlight! NeoTreeExpander             guifg=#cc4400
				highlight! NeoTreeCursorLine           guibg=#1a0500
				highlight! NeoTreeDimText              guifg=#441100
				highlight! NeoTreeModified             guifg=#ff4400
				highlight! NeoTreeGitAdded             guifg=#cc4400
				highlight! NeoTreeGitModified          guifg=#ff4400
				highlight! NeoTreeGitDeleted           guifg=#660000
				highlight! NeoTreeGitRenamed           guifg=#ff6600
				highlight! NeoTreeGitUntracked         guifg=#882200
				highlight! NeoTreeGitIgnored           guifg=#331100
				highlight! NeoTreeGitUnstaged          guifg=#993300
				highlight! NeoTreeGitStaged            guifg=#cc4400
				highlight! NeoTreeGitConflict          guifg=#ff0066 gui=bold
				highlight! NeoTreeTabActive            guibg=#cc4400 guifg=#0a0000 gui=bold
				highlight! NeoTreeTabInactive          guibg=#1a0000 guifg=#550000
				highlight! NeoTreeTabSeparatorActive   guifg=#cc4400 guibg=#cc4400
				highlight! NeoTreeTabSeparatorInactive guifg=#0a0000 guibg=#0a0000
			]])
		end

		-- reapply after lush resets highlights on colorscheme change
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = apply_highlights,
		})

		-- devicons: directories → orange, files → dark red
		local devicons = require("nvim-web-devicons")
		local icons = devicons.get_icons()
		for _, icon in pairs(icons) do
			icon.color = "#993300"
		end
		devicons.set_icon(icons)

		require("neo-tree").setup(opts)

		-- apply immediately on load
		apply_highlights()
	end,
}
