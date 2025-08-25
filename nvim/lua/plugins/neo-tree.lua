return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			filesystem = {
				follow_current_file = {
					enabled = true, -- Automatically focus the current file
					leave_dirs_open = false, -- Closes unneeded dirs
				},
				group_empty_dirs = true, -- Group empty folders
				hijack_netrw_behavior = "open_default", -- Replace netrw
			},
		})

		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
		vim.keymap.set("n", "<leader>o", function()
			if vim.bo.filetype == "neo-tree" then
				vim.cmd("wincmd p") -- jump back to last window
			else
				vim.cmd("Neotree focus") -- focus neo-tree
			end
		end, { desc = "Toggle focus Neo-tree" })
	end,
}
