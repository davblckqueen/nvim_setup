return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself
    ---@module "neo-tree"
    ---@type neotree.Config?
    opts = {
        -- fill any relevant options here
        -- jdkfjsdkfsa
        --
        close_if_last_window = true,
        default_component_configs = {
            git_status = {
                symbols = {
                    -- Change type
                    added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                    modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
                    deleted = "✖", -- this can only be used in the git_status source
                    renamed = "󰁕", -- this can only be used in the git_status source
                    -- Status type
                    untracked = "",
                    ignored = "",
                    unstaged = "󰄱",
                    staged = "",
                    conflict = "",
                },
            },
        },
        filesystem = {
            hijack_netrw_behavior = "open_current",
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
                            vim.print(path)
                            return {
                                text = string.format(" ⥤ %d", i), -- <-- Add your favorite harpoon like arrow here
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
                    { "harpoon_index" }, --> This is what actually adds the component in where you want it
                    { "diagnostics" },
                    { "git_status", highlight = "NeoTreeDimText" },
                },
            },
        },
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
                end,
            },
            {
                event = "neo_tree_buffer_leave",
                handler = function()
                    vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
                end,
            },
            {
                event = "file_open_requested",
                handler = function()
                    -- auto close
                    -- vim.cmd("Neotree close")
                    -- OR
                    require("neo-tree.command").execute({ action = "close" })
                end
            },
        }
    },
    keys = {
        { "<leader>pv", "<Cmd>Neotree toggle reveal=true<CR>", desc = "Toggle Neo-tree" },
    },
}
