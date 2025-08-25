return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Telescope find files in cwd" },
		{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Telescope find recent files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Telescope live grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Telescope show open buffers" },
		{ "<leader>fc", "<cmd>Telescope grep_string<CR>", desc = "Telescope find string under cursor" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Telescope find keymaps" },
		{ "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Telescope find diagnostics" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Telescope help tags" },

		-- Colorscheme
		{ "<leader>cs", "<cmd>Telescope colorscheme<CR>", desc = "Telescope change colorscheme" },
	},

	config = function()
		local telescope = require("telescope")
		telescope.load_extension("fzf")
	end,
}
