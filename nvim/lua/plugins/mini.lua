return {
	"echasnovski/mini.nvim",
	version = false, -- main branch (latest)
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring", -- for mini.comment
	},

	config = function()
		require("mini.pairs").setup() -- Autopairs
		require("mini.move").setup() -- Move any selection in any direction (Use Alt + direction)
		require("mini.surround").setup() -- Surround actions
		require("mini.indentscope").setup() -- Visualize and work with indent scope
		require("mini.splitjoin").setup() -- Split and join arguments (Toggle with gS)

		-- Commenting
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
		require("mini.comment").setup({ -- Comment lines (gcc to comment line, gc to comment selection)
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
				end,
			},
		})
	end,
}
