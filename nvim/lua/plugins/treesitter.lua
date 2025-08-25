return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },

	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"bash",
				"diff",
				"gitcommit",
				"vim",
				"vimdoc",
				"markdown",
				"markdown_inline",
				"json",
				"lua",
				"luadoc",
				"latex",
				"toml",
				"yaml",
				"query",

				"html",
				"css",
				"javascript",
				"typescript",
				"python",
				"c",
				"cpp",
				"go",
			},
			sync_install = false,
			auto_install = true,
			ignore_install = {},
			highlight = { enable = true, disable = {} },
			indent = { enable = true },
			modules = {},

			-- Enable incremental selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "ni", -- set to `false` to disable one of the mappings
					node_incremental = "ni",
					scope_incremental = "si",
					node_decremental = "nd",
				},
			},

			-- TODO: Need to add more keymaps below for Treesitter textobjects

			-- Treesitter textobjects
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			},
		})
	end,
}
