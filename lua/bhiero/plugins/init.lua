return {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight-night]])
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>po', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>pg', builtin.git_files, { desc = 'Telescope find on git files' })
      vim.keymap.set('n', '<leader>pf', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
    end,
  },
  {
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
                  "make"
	  },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      local harpoon = require("harpoon")
      harpoon:setup()
     
	-- basic telescope configuration
	local conf = require("telescope.config").values
	local function toggle_telescope(harpoon_files)
	    local file_paths = {}
	    for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	    end

	    require("telescope.pickers").new({}, {
		prompt_title = "Harpoon",
		finder = require("telescope.finders").new_table({
		    results = file_paths,
		}),
		previewer = conf.file_previewer({}),
		sorter = conf.generic_sorter({}),
	    }):find()
	end

	vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
	vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
	vim.keymap.set("n", "<leader>pe", function() toggle_telescope(harpoon:list()) end,
		{ desc = "Open harpoon window" })

	vim.keymap.set("n", "<C-h>1", function() harpoon:list():select(1) end)
	vim.keymap.set("n", "<C-h>2", function() harpoon:list():select(2) end)
	vim.keymap.set("n", "<C-h>3", function() harpoon:list():select(3) end)
	vim.keymap.set("n", "<C-h>4", function() harpoon:list():select(4) end)

	-- Toggle previous & next buffers stored within Harpoon list
	vim.keymap.set("n", "<C-Up>", function() harpoon:list():prev() end)
	vim.keymap.set("n", "<C-Down>", function() harpoon:list():next() end)
    end
  }
}
